import 'package:collection/collection.dart';
import 'package:media_kit/media_kit.dart' as mk;

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class ConsumetRepository {
  ConsumetRepository({List<AnimeProvider>? providers}) {
    this.providers = providers ??
        [
          Gogoanime(),
          Zoro(),
        ];
  }

  /// All the [AnimeProvider] that will be used to retrieve links
  late final List<AnimeProvider> providers;

  /// Finds the best link in term of resolution or returns the first one.
  VideoSource? _getBestLink(List<VideoSource> sources) {
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
    int maxLength = 100,
    bool dubbed = false,
  }) async {
    final List<ConsumetEpisode> results = [];

    final search = await provider.search(
      term,
      dubbed: dubbed,
    );

    if (search.isEmpty || search.firstOrNull?.id == null) return results;

    final info = await provider.fetchAnimeEpisodes(search.first.id!);
    final episodes = info.where((ep) => (ep.number ?? -1) >= minEpisode);

    for (final episode in episodes) {
      if (results.length == maxLength) break;

      final links = await provider.fetchEpisodeSources(episode);
      final link = _getBestLink(links.sources);

      if (link == null) continue;

      results.add(
        ConsumetEpisode(
          media: mk.Media(
            link.url,
            httpHeaders: links.headers,
            extras: {
              'episodeNumber': episode.number,
              'title': '$term - Episode ${episode.number}',
              'subtitles': link.subtitles,
            },
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
    bool dubbed = false,
    int minEpisode = 0,
    int maxLength = 100,
  }) async {
    List<ConsumetEpisode> results = [];

    for (final provider in providers) {
      try {
        results = await _getEpisodesLinksFromProvider(
          provider: provider,
          term: term,
          minEpisode: minEpisode,
          maxLength: maxLength,
          dubbed: dubbed,
        );

        if (results.isNotEmpty) break;
      } on NoEpisodeSourceException {
        logger.error('Could not get links for $term');
      } catch (e) {
        logger.error(
          'Unexpected error when retrieving episode links with $provider',
          e,
        );
      }
    }

    return results;
  }
}
