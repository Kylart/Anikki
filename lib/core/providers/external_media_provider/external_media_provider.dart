import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:anikki/core/providers/external_media_provider/provider/provider.dart';
import 'package:anikki/core/providers/external_media_provider/provider/youtube.dart';

///
/// ExternalMediaProvider
/// ---------------------
///
/// A minimal server to run locally & serve playable streams to external URLs.
///
class ExternalMediaProvider {
  /// Singleton instance of [ExternalMediaProvider] class.
  static ExternalMediaProvider? instance;

  ExternalMediaProvider._();

  /// {@macro external_media_provider}
  static Future<ExternalMediaProvider?> create() async {
    if (instance != null) return Future.value();
    instance = ExternalMediaProvider._();

    Future.microtask(() async {
      await instance?.bind();
    });
    return instance;
  }

  /// Disposes the singleton instance of [YTDaemon] class.
  static Future<void> dispose() async {
    if (instance == null) return Future.value();
    await instance?.server?.close();
    instance = null;
  }

  /// Creates the [server] & binds it to the [port] on `127.0.0.1`.
  Future<void> bind() async {
    final socket = await ServerSocket.bind('127.0.0.1', port);
    server = HttpServer.listenOn(socket);
    server?.listen(handler);
  }

  /// Handler for the request to the [server].
  Future<void> handler(HttpRequest request) async {
    final id = request.uri.queryParameters['id']!;
    for (final provider in providers) {
      if (request.uri.path == provider.path) {
        request.response.headers.set('location', await provider.stream(id));
        request.response.statusCode = HttpStatus.movedTemporarily;
        request.response.close();
        return;
      }
    }

    // If no matching [Provider] is found, return `404` status code.
    request.response.statusCode = HttpStatus.notFound;
    request.response.close();
  }

  /// Port on which [server] will be bind.
  /// Generated randomly between `0` && `65535`.
  final port = Random().nextInt(1 << 16);

  /// The [HttpServer] which is started to redirect URLs to a locally running server on `127.0.0.1`.
  /// This redirects to the actual playable stream using `302` status code i.e. [HttpStatus.movedTemporarily].
  HttpServer? server;

  /// All of the available [Provider]s.
  static final providers = <Provider>[
    YouTube(),
  ];
}
