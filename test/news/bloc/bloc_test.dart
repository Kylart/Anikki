import 'package:anikki/features/news/bloc/news_bloc.dart';
import 'package:anilist/anilist.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/models/local_file.dart';

import '../../fixtures/anilist.dart';

class MockLibraryRepository extends Mock implements LibraryRepository {}

class MockSettingsBloc extends Mock implements SettingsBloc {}

class MockLocalFile extends Mock implements LocalFile {}

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: News Bloc', () {
    late MockGraphQLClient mockGraphQLClient;
    late NewsBloc bloc;
    late Anilist repository;

    blocTest(
      'emits [NewsLoading, NewsComplete] when [NewsRequested] is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        NewsRequested(
          range: NewsBloc.initalDateRange,
        ),
      ),
      expect: () => [
        NewsLoading(range: NewsBloc.initalDateRange),
        isA<NewsComplete>()
            .having(
              (p0) => p0.entries.length,
              'with the right amount of entries',
              airingScheduleMock.Page?.airingSchedules?.length,
            )
            .having(
              (p0) => p0.range,
              'has right range',
              NewsBloc.initalDateRange,
            ),
      ],
      setUp: () {
        mockGraphQLClient = generateMockGraphQLClient();

        final result =
            generateMockQuery<Query$AiringSchedule>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(false);
        when(() => result.parsedData).thenReturn(airingScheduleMock);

        repository = Anilist(client: mockGraphQLClient);
        bloc = NewsBloc(repository);
      },
    );

    blocTest(
      'emits [NewsLoading, NewsError] when [NewsRequested] is added but fails',
      build: () => bloc,
      act: (bloc) => bloc.add(
        NewsRequested(
          range: NewsBloc.initalDateRange,
        ),
      ),
      expect: () => [
        NewsLoading(range: NewsBloc.initalDateRange),
        isA<NewsError>().having(
          (p0) => p0.range,
          'has right range',
          NewsBloc.initalDateRange,
        ),
      ],
      setUp: () {
        mockGraphQLClient = generateMockGraphQLClient();

        final result =
            generateMockQuery<Query$AiringSchedule>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(true);
        when(() => result.exception).thenReturn(OperationException());

        repository = Anilist(client: mockGraphQLClient);
        bloc = NewsBloc(repository);
      },
    );
  });
}
