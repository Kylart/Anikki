import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:path/path.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/models/torrent/transmission/models.dart' as tr;

import 'torrent_repository.dart';

const kSessionHeaderName = 'X-Transmission-Session-Id';

String _getStatus(int status) {
  assert(status >= 0 && status <= 7, 'Invalid Status');

  return [
    'Stopped',
    'Queued to verify local data',
    'Verifying local data',
    'Queued to download',
    'Downloading',
    'Queued to seed',
    'Seeding',
    'Unknown Status',
  ].elementAt(status);
}

class TransmissionRepository extends TorrentRepository {
  TransmissionRepository({
    super.username,
    super.password,
    super.client,
    super.uri,
  });

  @override
  Uri get defaultUri => Uri(
        scheme: 'http',
        host: 'localhost',
        port: 9091,
        path: 'transmission/rpc',
      );

  String get crendentialsHash =>
      hasCredentials ? base64Encode(utf8.encode('$username:$password')) : '';

  String _sessionId = '';

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        kSessionHeaderName: _sessionId,
        if (hasCredentials) 'Authorization': 'Basic $crendentialsHash',
      };

  Future<String> _send(
    tr.Method method, {
    tr.MethodType methodType = tr.MethodType.torrent,
    Map<String, dynamic>? arguments,
    int? tag,
  }) async {
    try {
      final response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode({
          'method': '${methodType.name}-${method.name}',
          if (arguments != null) 'arguments': arguments,
        }),
      );

      switch (response.statusCode) {
        case 200:
          return utf8.decode(response.bodyBytes);

        case 409:
          return _handle409(
            response,
            method,
            methodType: methodType,
            arguments: arguments,
            tag: tag,
          );

        case 401:
          throw const UnauthorizedError();

        default:
          throw HttpException('${response.statusCode}');
      }
    } on http.ClientException {
      throw const ConnectionRefusedError();
    } on HttpException {
      throw const ConnectionRefusedError();
    }
  }

  /// Inner method to handle CSRF protection protocol
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#231-csrf-protection`
  Future<String> _handle409(
    http.Response response,
    tr.Method method, {
    tr.MethodType methodType = tr.MethodType.torrent,
    Map<String, dynamic>? arguments,
    int? tag,
  }) {
    final sessionId = response.headers[kSessionHeaderName.toLowerCase()];

    if (sessionId == null) {
      throw const FormatException('Could not find Session ID.');
    }

    _sessionId = sessionId;
    return _send(
      method,
      methodType: methodType,
      arguments: arguments,
      tag: tag,
    );
  }

  /// Adds a torrent to the Transmission instance.
  /// `torrent` can be a magnet URL or a file URL to a .torrent file.
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#34-adding-a-torrent`
  @override
  Future<Torrent> addTorrent(String magnet) async {
    final response = await _send(
      tr.Method.add,
      arguments: {
        'filename': magnet,
      },
    );

    final result = tr.TorrentAdd.fromJson(response);

    if (result.result != 'success') {
      throw Exception('Could not add torrent - ${result.result}');
    }

    final torrents = await getTorrents();
    final torrent = torrents.firstWhere(
      (element) =>
          int.tryParse(element.id) == result.arguments?.torrentAdded?.id,
    );

    return torrent;
  }

  /// Retrieve all the current torrents in the Transmission instance
  /// along with all the fields available
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#33-torrent-accessor-torrent-get`
  ///
  @override
  Future<List<Torrent>> getTorrents() async {
    final response = await _send(
      tr.Method.get,
      arguments: {
        'fields': tr.kTorrentGetFields,
      },
    );

    final torrents = tr.TorrentGet.fromJson(response)
        .arguments
        ?.torrents
        ?.map(
          (e) => Torrent(
            magnet: e.magnetLink ?? '',
            id: e.id.toString(),
            hash: e.hashCode.toString(),
            progress: e.percentComplete ?? e.percentDone ?? 0.0,
            status: _getStatus(e.status ?? 0),
            path: normalize(join(e.downloadDir ?? '', e.name)),
            name: e.name ?? 'Unknown',
          ),
        )
        .toList();

    return torrents ?? [];
  }

  /// Removes a torrent from the Transmission instance
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#35-removing-a-torrent`
  @override
  Future<bool> removeTorrent(Torrent torrent,
      [bool deleteLocal = false]) async {
    final response = await _send(
      tr.Method.remove,
      arguments: {
        'delete-local-data': deleteLocal,
        'ids': [int.tryParse(torrent.id)],
      },
    );

    return tr.BasicResponse.fromJson(response).result == 'success';
  }

  /// Starts or resumes a torrent.
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#31-torrent-action-requests`
  @override
  Future<bool> startTorrent(Torrent torrent) async {
    final response = await _send(
      tr.Method.start,
      arguments: {
        'ids': [int.tryParse(torrent.id)],
      },
    );

    return tr.BasicResponse.fromJson(response).result == 'success';
  }

  /// Stops a torrent from communicating. Does not remove it from the
  /// Transmission instance.
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#31-torrent-action-requests`
  @override
  Future<bool> stopTorrent(Torrent torrent) async {
    final response = await _send(
      tr.Method.stop,
      arguments: {
        'ids': [int.tryParse(torrent.id)],
      },
    );

    return tr.BasicResponse.fromJson(response).result == 'success';
  }

  /// Enables streaming options for an active torrent file
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#32-torrent-mutator-torrent-set`
  @override
  Future<bool> streamTorrent(Torrent torrent) async {
    final response = await _send(
      tr.Method.set,
      arguments: {
        'sequentialDownload': true,
        'bandwidthPriority': 1,
        'ids': [int.tryParse(torrent.id)],
      },
    );

    return tr.BasicResponse.fromJson(response).result == 'success';
  }

  @override
  Future<void> login() async {}
}
