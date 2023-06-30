import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:anikki/features/torrent/domain/repository/repository.dart';
import 'package:anikki/features/torrent/domain/models/models.dart';
import 'package:anikki/features/torrent/domain/models/qbittorrent/models.dart'
    as qbit;

enum ApiName {
  auth,
  torrents,
}

const kQbitTorrentStatuses = {
  'error': 'Error',
  'missingFiles': 'Torrent data files is missing',
  'uploading': 'Uploading',
  'pausedUP': 'Paused',
  'queuedUP': 'Queued',
  'stalledUP': 'Seeding - No peer connection',
  'checkingUP': 'Checking',
  'forcedUP': 'Uploading',
  'allocating': 'Allocating',
  'downloading': 'Downloading',
  'metaDL': 'Fetching metadata',
  'pausedDL': 'Paused',
  'queuedDL': 'Queued',
  'stalledDL': 'Downloading - No peer connection',
  'checkingDL': 'Checking',
  'forcedDL': 'Downloading',
  'checkingResumeData': 'Resuming',
  'moving': 'Moving',
  'unknown': 'Unknown',
};

String _getStatus(String? state) {
  if (kQbitTorrentStatuses.containsKey(state)) {
    return kQbitTorrentStatuses[state]!;
  }

  return 'Unknown';
}

class QBitTorrentRepository extends TorrentRepository {
  QBitTorrentRepository({
    super.username,
    super.password,
    super.client,
    super.uri,
  });

  @override
  Uri get defaultUri => Uri(
        scheme: 'http',
        host: 'localhost',
        port: 8080,
      );

  String _cookie = 'no-cookie';

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
      qbit.TorrentsMethod.values.map((e) => e.name).contains(methodName) ||
          qbit.AuthMethod.values.map((e) => e.name).contains(methodName),
      'Invalid Method',
    );

    final response = await client.get(
      uri.replace(path: 'api/v2/${apiName.name}/$methodName'),
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
      qbit.TorrentsMethod.values.map((e) => e.name).contains(methodName) ||
          qbit.AuthMethod.values.map((e) => e.name).contains(methodName),
      'Invalid Method',
    );

    final request = http.MultipartRequest(
      'POST',
      uri.replace(path: 'api/v2/${apiName.name}/$methodName'),
    );

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      if (apiName != ApiName.auth) ...headers,
    });

    for (final key in arguments.keys) {
      request.fields[key] = arguments[key]!;
    }

    final response = await client.send(request);

    _handleStatusCode(response.statusCode);

    return response;
  }

  /// Login requires usename and password to get a Cookie
  /// that will be stored internally and used to send requests to the API.
  ///
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#login
  @override
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
        qbit.AuthMethod.login.name,
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
  @override
  Future<List<Torrent>> getTorrents() async {
    final response =
        await _get(ApiName.torrents, qbit.TorrentsMethod.info.name);

    final rawResult = jsonDecode(response) as List;
    final List<qbit.Torrent> result = [];

    for (final raw in rawResult) {
      result.add(qbit.Torrent.fromMap(raw));
    }

    return result
        .map(
          (e) => Torrent(
            magnet: e.magnetUri ?? '',
            id: e.hash ?? '',
            hash: e.hash ?? '',
            progress: e.progress ?? 0.0,
            status: _getStatus(e.state ?? 'Unknown'),
            path: e.contentPath ?? '',
            name: e.name ?? 'Unknwon',
          ),
        )
        .toList();
  }

  /// Add a Torrent to the instance
  ///
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#add-new-torrent
  @override
  Future<Torrent> addTorrent(String magnet) async {
    await _post(
      ApiName.torrents,
      qbit.TorrentsMethod.add.name,
      {
        'urls': magnet,
        // 'sequentialDownload': streaming.toString(),
        // 'firstLastPiecePrio': streaming.toString(),
      },
    );

    final torrents = await getTorrents();
    final hash = Uri.parse(magnet).queryParameters['xt'];
    final torrent = torrents.firstWhere(
        (element) => Uri.parse(element.magnet).queryParameters['xt'] == hash);

    return torrent;
  }

  /// Remove a torrent from the instance
  ///
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#delete-torrents
  @override
  Future<bool> removeTorrent(Torrent torrent,
      [bool deleteLocal = false]) async {
    await _post(
      ApiName.torrents,
      qbit.TorrentsMethod.delete.name,
      {
        'hashes': torrent.hash,
        'deleteFiles': deleteLocal.toString(),
      },
    );

    return true;
  }

  /// Resume a paused torrent
  ///
  /// Doc: https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)#resume-torrents
  @override
  Future<bool> startTorrent(Torrent torrent) async {
    await _post(
      ApiName.torrents,
      qbit.TorrentsMethod.resume.name,
      {
        'hashes': torrent.hash,
      },
    );

    return true;
  }

  @override
  Future<bool> stopTorrent(Torrent torrent) async {
    await _post(
      ApiName.torrents,
      qbit.TorrentsMethod.pause.name,
      {
        'hashes': torrent.hash,
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
  @override
  Future<bool> streamTorrent(Torrent torrent) async {
    await Future.wait([
      _post(
        ApiName.torrents,
        qbit.TorrentsMethod.toggleSequentialDownload.name,
        {
          'hashes': torrent.hash,
        },
      ),
      _post(
        ApiName.torrents,
        qbit.TorrentsMethod.toggleFirstLastPiecePrio.name,
        {
          'hashes': torrent.hash,
        },
      ),
    ]);

    return true;
  }
}
