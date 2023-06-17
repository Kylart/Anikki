import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'package:anikki/core/providers/external_media_provider/provider/provider.dart';

/// A [Provider] for YouTube.
class YouTube implements Provider {
  final YoutubeExplode client = YoutubeExplode();

  /// The path used by this [Provider] when serving on the local [HttpServer] instance.
  @override
  String get path => '/youtube';

  /// Redirects the given [uri] to the local [HttpServer] instance.
  /// Returns `null` if the given [uri] is not supported by this [Provider].
  @override
  Uri? redirect(Uri uri, int port) {
    // https://youtu.be/watch?v=abcdefghi.
    if (uri.host.contains('youtu.be')) {
      return Uri.http(
        '127.0.0.1:$port',
        '/youtube',
        {
          'id': uri.path.replaceAll('/', ''),
        },
      );
    }
    // https://www.youtube.com/watch?v=abcdefghi.
    if (uri.host.contains('youtube.com') &&
        uri.path.contains('/watch') &&
        uri.queryParameters.containsKey('v')) {
      return Uri.http(
        '127.0.0.1:$port',
        '/youtube',
        {
          'id': uri.queryParameters['v'],
        },
      );
    }
    return null;
  }

  /// Returns the thumbnail for the given [uri].
  /// If [id] is provided, it will be used instead of the [uri].
  @override
  Uri thumbnail(Uri? uri, {String? id, bool small = false}) {
    if (id != null) {
      return Uri.https(
        'i.ytimg.com',
        '/vi/$id/${small ? 'mqdefault' : 'maxresdefault'}.jpg',
      );
    }
    if (uri != null) {
      final result = redirect(uri, 0);
      if (result != null) {
        return Uri.https(
          'i.ytimg.com',
          '/vi/${result.queryParameters['id']}/${small ? 'mqdefault' : 'maxresdefault'}.jpg',
        );
      }
    }
    throw UnsupportedError('UnsupportedError: $uri');
  }

  /// Gives the playable stream URL for the given [id].
  @override
  Future<String> stream(String id) async {
    final manifest = await client.videos.streams.getManifest(id);
    final info = manifest.muxed.withHighestBitrate().url;
    return info.toString();
  }
}
