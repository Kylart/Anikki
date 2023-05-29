import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:transmission/src/errors/errors.dart';
import 'package:transmission/src/models/models.dart';

const kSessionHeaderName = 'X-Transmission-Session-Id';

class Transmission {
  Transmission({
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
      throw ConnectionRefusedError();
    }
  }

  Future<String> _handle409(
    http.Response response,
    Method method, {
    MethodType methodType = MethodType.torrent,
    Map<String, dynamic>? arguments,
    int? tag,
  }) {
    final sessionId = response.headers[kSessionHeaderName.toLowerCase()];

    if (sessionId == null) throw FormatException('Could not find Session ID.');

    _sessionId = sessionId;
    return _send(
      method,
      methodType: methodType,
      arguments: arguments,
      tag: tag,
    );
  }

  Future<SessionGet> getSession() async {
    final response = await _send(
      Method.get,
      methodType: MethodType.session,
    );

    return SessionGet.fromJson(response);
  }

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

  Future<bool> stopTorrent(int id) async {
    final response = await _send(
      Method.stop,
      arguments: {
        'ids': [id],
      },
    );

    return BasicResponse.fromJson(response).result == 'success';
  }

  Future<bool> startTorrent(int id) async {
    final response = await _send(
      Method.start,
      arguments: {
        'ids': [id],
      },
    );

    return BasicResponse.fromJson(response).result == 'success';
  }

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
