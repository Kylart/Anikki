import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

/// Repository to handle searching for torrents
class TorrentSearchRepository {
  const TorrentSearchRepository(this.nyaa);

  /// The [Nyaa] provider to use for this repository
  final Nyaa nyaa;

  /// Search `nyaa.si` for torrents using the given `term`.
  Future<List<NyaaTorrent>> searchNyaa(String term) async {
    return await nyaa.search(term);
  }

  /// Generates a `term` using the available information
  String makeTerm({
    Media? media,
    LibraryEntry? entry,
    int? episode,
    String? title,
  }) {
    String term = title ??
        entry?.entries.first.title ??
        media?.anilistInfo.title?.userPreferred ??
        '';

    if (episode != null) term += ' $episode';

    return term;
  }
}
