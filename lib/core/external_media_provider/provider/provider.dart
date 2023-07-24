/// Defines the [Provider] interface.
///
/// A [Provider] is a class that can provide playable stream URLs for a given [id].
///
mixin Provider {
  /// The path used by this [Provider] when serving on the local [HttpServer] instance.
  String get path;

  /// Redirects the given [uri] to the local [HttpServer] instance.
  /// Returns `null` if the given [uri] is not supported by this [Provider].
  Uri? redirect(Uri uri, int port);

  /// Returns the thumbnail for the given [uri].
  /// If [id] is provided, it will be used instead of the [uri].
  Uri thumbnail(Uri? uri, {String? id, bool small = false});

  /// Gives the playable stream URL for the given [id].
  Future<String> stream(String id);
}
