import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:anikki/features/transmission/domain/models/models.dart';

const kSessionHeaderName = 'X-Transmission-Session-Id';

/// Class to remotely commuincate with a Transmission instance using its RPC api.
///
/// Documentation for RPC api: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md`
///
/// Example:
/// ```dart
/// /// Instanciate link
/// final transmission = Transmission(
///   uri: transmissionUri,
///   username: username,
///   password: password,
/// );
///
/// /// Read current session information
/// await transmission.getSession();
/// ```
///
class TransmissionRepository {
  TransmissionRepository({
    Uri? uri,
    http.Client? client,
    this.username,
    this.password,
  }) {
    _uri = uri ??
        Uri(
          scheme: 'http',
          host: 'localhost',
          port: 9091,
          path: 'transmission/rpc',
        );

    _client = client ?? http.Client();
  }

  late final Uri _uri;

  final String? username;
  final String? password;

  late final http.Client _client;

  bool get hasCredentials =>
      username != null &&
      username!.isNotEmpty &&
      password != null &&
      password!.isNotEmpty;
  String get crendentialsHash =>
      hasCredentials ? base64Encode(utf8.encode('$username:$password')) : '';

  String _sessionId = '';

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        kSessionHeaderName: _sessionId,
        if (hasCredentials) 'Authorization': 'Basic $crendentialsHash',
      };

  Future<String> _send(
    Method method, {
    MethodType methodType = MethodType.torrent,
    Map<String, dynamic>? arguments,
    int? tag,
  }) async {
    try {
      final response = await _client.post(
        _uri,
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
    Method method, {
    MethodType methodType = MethodType.torrent,
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

  /// Allows to get client session information
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#412-accessors`
  Future<SessionGet> getSession() async {
    final response = await _send(
      Method.get,
      methodType: MethodType.session,
    );

    return SessionGet.fromJson(response);
  }

  /// Retrieve all the current torrents in the Transmission instance
  /// along with all the fields available
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#33-torrent-accessor-torrent-get`
  ///
  Future<TorrentGet> getTorrents([List<int>? ids]) async {
    final response = await _send(
      Method.get,
      arguments: {
        'fields': kTorrentGetFields,
        if (ids != null) 'ids': ids,
      },
    );

    return TorrentGet.fromJson(response);
  }

  /// Adds a torrent to the Transmission instance.
  /// `torrent` can be a magnet URL or a file URL to a .torrent file.
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#34-adding-a-torrent`
  Future<TorrentAdd> addTorrent(String torrent) async {
    final response = await _send(
      Method.add,
      arguments: {
        'filename': torrent,
      },
    );

    final result = TorrentAdd.fromJson(response);

    if (result.result != 'success') {
      throw Exception('Could not add torrent - ${result.result}');
    }

    return result;
  }

  /// Stops a torrent from communicating. Does not remove it from the
  /// Transmission instance.
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#31-torrent-action-requests`
  Future<bool> stopTorrent(int id) async {
    final response = await _send(
      Method.stop,
      arguments: {
        'ids': [id],
      },
    );

    return BasicResponse.fromJson(response).result == 'success';
  }

  /// Starts or resumes a torrent.
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#31-torrent-action-requests`
  Future<bool> startTorrent(int id) async {
    final response = await _send(
      Method.start,
      arguments: {
        'ids': [id],
      },
    );

    return BasicResponse.fromJson(response).result == 'success';
  }

  /// Removes a torrent from the Transmission instance
  ///
  /// More here: `https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md#35-removing-a-torrent`
  Future<bool> removeTorrent(int id, [bool deleteLocal = false]) async {
    final response = await _send(
      Method.remove,
      arguments: {
        'delete-local-data': deleteLocal,
        'ids': [id],
      },
    );

    return BasicResponse.fromJson(response).result == 'success';
  }
}
