import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/app/search/bloc/search_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

import '../../../fixtures/anilist.dart';
import '../../../fixtures/nyaa.dart';

class MockAnimeInformationRepository extends Mock
    implements AnimeInformationRepository {}

void main() {
  group('unit test: Search Bloc', () {
    late SearchBloc bloc;
    late MockAnimeInformationRepository repository;
    late SearchResult searchResult;
    String term = 'Sakura Trick';

    blocTest(
      'emits [SearchEmptyTerm] when [SearchRequested] is added but no term is given',
      build: () => bloc,
      act: (bloc) => bloc.add(
        const SearchRequested(''),
      ),
      expect: () => [
        const SearchEmptyTerm(),
      ],
      setUp: () {
        repository = MockAnimeInformationRepository();
        bloc = SearchBloc(repository);
      },
    );

    blocTest(
      'emits [SearchLoading, SearchSuccess] when [SearchRequested] is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        SearchRequested(term),
      ),
      expect: () => [
        SearchLoading(term),
        SearchSuccess(term, searchResult),
      ],
      setUp: () {
        repository = MockAnimeInformationRepository();
        searchResult = SearchResult(
          term: term,
          torrents: torrentMocks,
          medias: [shortMediaMock],
        );

        when(() => repository.search(term))
            .thenAnswer((_) async => searchResult);

        bloc = SearchBloc(repository);
      },
    );

    blocTest(
      'emits [SearchLoading, SearchError] when [SearchRequested] is added but fails',
      build: () => bloc,
      act: (bloc) => bloc.add(
        SearchRequested(term),
      ),
      expect: () => [
        SearchLoading(term),
        SearchError(term, Exception('error').toString()),
      ],
      setUp: () {
        repository = MockAnimeInformationRepository();

        when(() => repository.search(term)).thenThrow(Exception('error'));

        bloc = SearchBloc(repository);
      },
    );
  });
}
