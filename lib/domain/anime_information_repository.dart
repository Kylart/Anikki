import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class AnimeInformationRepository {
  const AnimeInformationRepository(this.anilist, this.nyaa);

  /// The [Anilist] API to use for this repository
  final Anilist anilist;

  /// The [Nyaa] API to use for this repository
  final Nyaa nyaa;

  /// Search providers using `term`
  /// Will also search given `libraryEntries`
  Future<SearchResult> search(
    String term, {
    List<LibraryEntry> libraryEntries = const [],
  }) async {
    final filteredLibraryEntries = _getLibraryEntries(term, libraryEntries);

    try {
      final results = await Future.wait([
        _searchNyaa(term),
        _searchAnilist(term),
      ]);

      final torrents = results.first as List<NyaaTorrent>;
      final anilistResult =
          results.last as Map<AnilistSearchPart, List<Object>>;

      return SearchResult(
        term: term,
        libraryEntries: filteredLibraryEntries,
        torrents: torrents,
        staffs: anilistResult[AnilistSearchPart.staffs]
            as List<Query$Search$staff$results>,
        characters: anilistResult[AnilistSearchPart.characters]
            as List<Query$Search$characters$results>,
        medias: anilistResult[AnilistSearchPart.animes]
            as List<Fragment$shortMedia>,
      );
    } catch (e) {
      logger.e('Error while searching', e);

      if (filteredLibraryEntries.isEmpty) rethrow;

      return SearchResult(
        term: term,
        libraryEntries: filteredLibraryEntries,
      );
    }
  }

  Future<List<NyaaTorrent>> _searchNyaa(String term) async {
    try {
      return await nyaa.search(term);
    } on NyaaNoResultException {
      return const [];
    }
  }

  Future<Map<AnilistSearchPart, List<Object>>> _searchAnilist(
      String term) async {
    return await anilist.search(term);
  }

  List<LibraryEntry> _getLibraryEntries(
      String term, List<LibraryEntry> entries) {
    term = term.toLowerCase();

    return entries
        .where(
          (entry) =>
              (entry.media?.title ?? '').toLowerCase().contains(term) ||
              (entry.entries.first.title ?? '').toLowerCase().contains(term),
        )
        .toList();
  }
}
