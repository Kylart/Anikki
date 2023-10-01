import 'package:collection/collection.dart';
import 'package:media_kit/media_kit.dart' as mk;

import 'package:anikki/core/core.dart';
import 'package:anikki/data/consumet/models/anime/anime_watch_reponse/source.dart';
import 'package:anikki/data/data.dart';

class ConsumetRepository {
  ConsumetRepository({List<AnimeProvider>? providers}) {
    this.providers = providers ??
        [
          GogoanimeProvider(),
          AnimefoxProvider(),
          AnimepaheProvider(),
          ZoroProvider(),
        ];
  }

  /// All the [AnimeProvider] that will be used to retrieve links
  late final List<AnimeProvider> providers;

  /// Finds the best link in term of resolution or returns the first one.
  Source? _getBestLink(List<Source> sources) {
    return sources.firstWhereOrNull((source) => source.quality == '1080p') ??
        sources.firstWhereOrNull((source) => source.quality == 'default') ??
        sources.firstWhereOrNull((source) => source.quality == '720p') ??
        sources.firstWhereOrNull((source) => source.quality == '480p') ??
        sources.firstWhereOrNull((source) => source.quality == '360p') ??
        sources.firstWhereOrNull((source) => source.quality == 'backup') ??
        sources.firstOrNull;
  }

  /// Does all the inside work necessary for a given provider to give episode [Media]
  /// from a single term and a minimum episode.
  ///
  /// Using an [AnimeProvider], it will takes the first result of the `search` method
  /// and use it to return a [List<ConsumetEpisode>] that will be in ascending order
  /// starting from the given `minEpisode`.
  Future<List<ConsumetEpisode>> _getEpisodesLinksFromProvider({
    required AnimeProvider provider,
    required String term,
    required int minEpisode,
  }) async {
    final List<ConsumetEpisode> results = [];

    final search = await provider.search(term);

    if (search.isEmpty || search.firstOrNull?.id == null) return results;

    final info = await provider.info(search.first.id!);
    final episodes = info.episodes
            ?.where((ep) => ep.id != null && (ep.number ?? -1) >= minEpisode) ??
        [];

    for (final episode in episodes) {
      final links = await provider.watch(episode.id!);

      if (links.sources == null) continue;

      final link = _getBestLink(links.sources!);

      if (link == null || link.url == null) continue;

      results.add(
        ConsumetEpisode(
          media: mk.Media(
            link.url!,
            httpHeaders: links.headers?.toMap() as Map<String, String>,
          ),
          number: episode.number!.toInt(),
        ),
      );
    }

    return results;
  }

  /// Finds the best available anime episodes for `term` using the consumet API
  /// If `minEpisode` is given, will return the best available episodes starting
  /// `minEpisode` and all those that come after.
  Future<List<ConsumetEpisode>> getEpisodeLinks(
    String term, {
    int minEpisode = 0,
  }) async {
    List<ConsumetEpisode> results = [];

    for (final provider in providers) {
      try {
        results = await _getEpisodesLinksFromProvider(
          provider: provider,
          term: term,
          minEpisode: minEpisode,
        );

        if (results.isNotEmpty) break;
      } on AnimeConsumetError catch (e) {
        logger.e('Could not get links for $term', error: e);
      }
    }

    return results;
  }
}
