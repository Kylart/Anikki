import 'package:flutter_test/flutter_test.dart';

import 'package:anikki/data/data.dart';

const _kSearchTerm = 'Sousou no Frieren';

void main() {
  group('unit test: Consumet providers', () {
    final providers = [
      Gogoanime(),
      // Zoro(),
    ];

    late List<AnimeResult> searchResult;
    late List<AnimeEpisode> episodes;
    late AnimeSource sources;

    for (final provider in providers) {
      group('${provider.runtimeType} provider', () {
        tearDownAll(() {
          searchResult = [];
          episodes = [];
          sources = const AnimeSource(headers: {}, sources: [], download: '');
        });

        test('search method', () async {
          searchResult = await provider.search(_kSearchTerm);

          expect(searchResult, isNotEmpty);
        });

        test('fetchAnimeEpisodes method', () async {
          final id = searchResult.first.id;

          if (id == null) return;

          episodes = await provider.fetchAnimeEpisodes(id);

          expect(episodes, isNotEmpty);
        });

        test('fetchEpisodeSources method', () async {
          if (episodes.isEmpty) return;

          sources = await provider.fetchEpisodeSources(episodes.first);

          expect(sources.sources, isNotEmpty);
        });
      });
    }
  });
}
