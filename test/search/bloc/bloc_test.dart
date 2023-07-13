import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/features/search/domain/models/models.dart';
import 'package:anikki/features/search/domain/repository/repository.dart';
import 'package:anikki/features/search/presentation/bloc/search_bloc.dart';

import '../../fixtures/anilist.dart';
import '../../fixtures/nyaa.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: Search Bloc', () {
    late SearchBloc bloc;
    late MockSearchRepository repository;
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
        repository = MockSearchRepository();

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
        repository = MockSearchRepository();
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
        repository = MockSearchRepository();

        when(() => repository.search(term)).thenThrow(Exception('error'));

        bloc = SearchBloc(repository);
      },
    );
  });
}
