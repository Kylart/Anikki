import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:anikki/features/qbittorrent/domain/models/models.dart';

enum ApiName {
  auth,
  torrents,
}

/// Repository to access a remote QBitTorrent instance. The API is a RPC API
/// 
/// API documentation: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)
class QBitTorrentRepository {
  QBitTorrentRepository({
    Uri? uri,
    http.Client? client,
    this.username,
    this.password,
  }) {
    _uri = uri ??
        Uri(
          scheme: 'http',
          host: 'localhost',
          port: 8080,
        );

    _client = client ?? http.Client();
  }

  late final http.Client _client;
  late final Uri _uri;

  final String? username;
  final String? password;

  String _cookie = 'no-cookie';

  bool get hasCredentials =>
      username != null &&
      username!.isNotEmpty &&
      password != null &&
      password!.isNotEmpty;

  Map<String, String> get headers => {
        'Cookie': _cookie,
      };

  void _handleStatusCode(int status) {
    if (status == 403) {
      throw const UserIsBannedError();
    }

    if (status == 401) {
      throw const UnauthorizedError();
    }

    if (status != 200) {
      throw HttpException('$status');
    }
  }

  /// Internal method to access GET routes of the API
  Future<String> _get(ApiName apiName, String methodName) async {
    assert(
      TorrentsMethod.values.map((e) => e.name).contains(methodName) ||
          AuthMethod.values.map((e) => e.name).contains(methodName),
      'Invalid Method',
    );

    final response = await _client.get(
      _uri.replace(path: 'api/v2/${apiName.name}/$methodName'),
      headers: headers,
    );

    _handleStatusCode(response.statusCode);

    return utf8.decode(response.bodyBytes);
  }

  /// Internal method to access POST routes of the API
  Future<http.StreamedResponse> _post(
    ApiName apiName,
    String methodName, [
    Map<String, String> arguments = const {},
  ]) async {
    assert(
      TorrentsMethod.values.map((e) => e.name).contains(methodName) ||
          AuthMethod.values.map((e) => e.name).contains(methodName),
      'Invalid Method',
    );

    final request = http.MultipartRequest(
      'POST',
      _uri.replace(path: 'api/v2/${apiName.name}/$methodName'),
    );

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      if (apiName != ApiName.auth) ...headers,
    });

    for (final key in arguments.keys) {
      request.fields[key] = arguments[key]!;
    }

    final response = await _client.send(request);

    _handleStatusCode(response.statusCode);

    return response;
  }

  /// Login requires usename and password to get a Cookie
  /// that will be stored internally and used to send requests to the API.
  /// 
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#login
  Future<void> login() async {
    final Map<String, String> arguments = hasCredentials
        ? {
            'username': username!,
            'password': password!,
          }
        : {};

    try {
      final response = await _post(
        ApiName.auth,
        AuthMethod.login.name,
        arguments,
      );

      if (response.headers['set-cookie'] != null) {
        _cookie = response.headers['set-cookie']!;
      } else {
        throw const UnauthorizedError();
      }
    } on HttpException {
      throw const UnauthorizedError();
    }
  }

  /// Returns all the torrents currently in the instance
  /// 
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#get-torrent-list
  Future<List<Torrent>> getTorrents() async {
    final response = await _get(ApiName.torrents, TorrentsMethod.info.name);

    final rawResult = jsonDecode(response) as List;
    final List<Torrent> result = [];

    for (final raw in rawResult) {
      result.add(Torrent.fromMap(raw));
    }

    return result;
  }

  /// Pause a torrent. It won't be downloading or seeding.
  /// 
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#pause-torrents
  Future<bool> pauseTorrent(String? hash) async {
    await _post(
      ApiName.torrents,
      TorrentsMethod.pause.name,
      {
        'hashes': hash ?? 'all',
      },
    );

    return true;
  }

  /// Resume a paused torrent
  /// 
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#resume-torrents
  Future<bool> resumeTorrent(String? hash) async {
    await _post(
      ApiName.torrents,
      TorrentsMethod.resume.name,
      {
        'hashes': hash ?? 'all',
      },
    );

    return true;
  }

  /// Remove a torrent from the instance
  /// 
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#delete-torrents
  Future<bool> deleteTorrent(String? hash, [bool deleteFiles = false]) async {
    await _post(
      ApiName.torrents,
      TorrentsMethod.delete.name,
      {
        'hashes': hash ?? 'all',
        'deleteFiles': deleteFiles.toString(),
      },
    );

    return true;
  }

  /// Add a Torrent to the instance
  /// 
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#add-new-torrent
  Future<bool> addTorrent(String url,
      {String? path, bool streaming = false}) async {
    await _post(
      ApiName.torrents,
      TorrentsMethod.add.name,
      {
        'urls': url,
        if (path != null) 'path': path,
        'sequentialDownload': streaming.toString(),
        'firstLastPiecePrio': streaming.toString(),
      },
    );

    return true;
  }

  /// Setup a torrent to be 'streamed' without seeking possibilities.
  /// This will set the right torrent properties to enable sequential 
  /// download and First-Last pieces download on the torrent.
  /// 
  /// Doc:
  ///   * Sequential DL: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#toggle-sequential-download
  ///   * FL priority: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#set-firstlast-piece-priority
  Future<bool> streamTorrent(Torrent torrent) async {
    await Future.wait([
      if (torrent.seqDl != true)
        _post(
          ApiName.torrents,
          TorrentsMethod.toggleSequentialDownload.name,
          {
            'hashes': torrent.hash!,
          },
        ),
      if (torrent.fLPiecePrio != true)
        _post(
          ApiName.torrents,
          TorrentsMethod.toggleFirstLastPiecePrio.name,
          {
            'hashes': torrent.hash!,
          },
        ),
    ]);

    return true;
  }


  /// Setup a torrent to be 'streamed' without seeking possibilities.
  /// This will set the right torrent properties to disable sequential 
  /// download and First-Last pieces download on the torrent.
  /// 
  /// It will NOT remove the torrent from the instance.
  /// 
  /// Doc:
  ///   * Sequential DL: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#toggle-sequential-download
  ///   * FL priority: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#set-firstlast-piece-priority
  Future<bool> stopStreamTorrent(Torrent torrent) async {
    await Future.wait([
      if (torrent.seqDl != false)
        _post(
          ApiName.torrents,
          TorrentsMethod.toggleSequentialDownload.name,
          {
            'hashes': torrent.hash!,
          },
        ),
      if (torrent.fLPiecePrio != false)
        _post(
          ApiName.torrents,
          TorrentsMethod.toggleFirstLastPiecePrio.name,
          {
            'hashes': torrent.hash!,
          },
        ),
    ]);

    return true;
  }
}
