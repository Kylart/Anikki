import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:qbittorrent/src/errors/errors.dart';
import 'package:qbittorrent/src/errors/user_is_banned_error.dart';
import 'package:qbittorrent/src/models/torrent.dart';

enum AuthMethod { login }

enum TorrentsMethod {
  info,
  pause,
  resume,
  delete,
  add,

  toggleSequentialDownload,
  toggleFirstLastPiecePrio,
}

enum ApiName {
  auth,
  torrents,
}

class QBitTorrent {
  QBitTorrent({
    Uri? uri,
    http.Client? client,
    this.username,
    this.password,
  }) {
    _uri = uri ?? Uri(scheme: 'http', host: 'localhost', port: 8080);

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
      throw UserIsBannedError();
    }

    if (status == 401) {
      throw UnauthorizedError();
    }

    if (status != 200) {
      throw HttpException('$status');
    }
  }

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

    final response = await request.send();

    _handleStatusCode(response.statusCode);

    return response;
  }

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
        throw UnauthorizedError();
      }
    } on HttpException {
      throw UnauthorizedError();
    }
  }

  Future<List<Torrent>> getTorrents() async {
    final response = await _get(ApiName.torrents, TorrentsMethod.info.name);

    final rawResult = jsonDecode(response) as List;
    final List<Torrent> result = [];

    for (final raw in rawResult) {
      result.add(Torrent.fromMap(raw));
    }

    return result;
  }

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
