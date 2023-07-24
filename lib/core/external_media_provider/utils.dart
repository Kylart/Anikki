import 'package:anikki/core/external_media_provider/external_media_provider.dart';

/// Additional methods for [ExternalMediaProvider].
extension ExternalMedia on ExternalMediaProvider {
  /// Redirects the given [uri] to the local [HttpServer] instance.
  ///
  /// Returns the [uri] as-is if it is not supported by any of the [Provider]s.
  static Uri redirect(Uri uri) {
    assert(ExternalMediaProvider.instance != null);
    final instance = ExternalMediaProvider.instance!;
    for (final provider in ExternalMediaProvider.providers) {
      final result = provider.redirect(uri, instance.port);
      if (result != null) {
        return result;
      }
    }
    return uri;
  }

  /// Returns whether the given [uri] is supported by any of the [Provider]s.
  static bool supported(Uri uri) {
    // Already re-directed [uri].
    if (uri.authority.contains('127.0.0.1') ||
        uri.authority.contains('localhost')) {
      for (final provider in ExternalMediaProvider.providers) {
        if (uri.path == provider.path) return true;
      }
    }
    // Not re-directed [uri].
    else if (redirect(uri) != uri) {
      return true;
    }
    return false;
  }

  /// Gets the thumbnail URL for the given YouTube video URL.
  ///
  /// Passing [small] as `true` will result in a smaller sized image.
  ///
  static Uri thumbnail(Uri uri, {bool small = false}) {
    // Already re-directed [uri].
    if (uri.authority.contains('127.0.0.1') ||
        uri.authority.contains('localhost')) {
      for (final provider in ExternalMediaProvider.providers) {
        if (uri.path == provider.path) {
          return provider.thumbnail(
            null,
            id: uri.queryParameters['id'],
            small: small,
          );
        }
      }
    }
    final result = redirect(uri);
    if (result != uri) {
      return thumbnail(result, small: small);
    }
    throw UnsupportedError('UnsupportedError: $uri');
  }
}
