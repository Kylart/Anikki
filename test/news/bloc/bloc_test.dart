import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/library/domain/models/models.dart';
import 'package:anikki/features/news/presentation/bloc/news_bloc.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/features/library/domain/repository/repository.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';

import '../../fixtures/anilist.dart';
import '../../fixtures/settings.dart';

class MockLibraryRepository extends Mock implements LibraryRepository {}

class MockSettingsBloc extends Mock implements SettingsBloc {}

class MockWatchListBloc extends Mock implements WatchListBloc {}

class MockLocalFile extends Mock implements LocalFile {}

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: News Bloc', () {
    late MockGraphQLClient mockGraphQLClient;
    late NewsBloc bloc;
    late SettingsBloc settingsBloc;
    late WatchListBloc watchListBloc;
    late Anilist repository;

    setUp(() {
      /// Settings Bloc mock
      settingsBloc = MockSettingsBloc();
      when(() => settingsBloc.stream).thenAnswer(
        (_) => const Stream<SettingsState>.empty(),
      );
      when(() => settingsBloc.state).thenAnswer(
        (_) => const SettingsState(
          settings: settings,
        ),
      );

      /// WatchList Bloc mock
      watchListBloc = MockWatchListBloc();
      when(() => watchListBloc.stream).thenAnswer(
        (_) => const Stream<WatchListState>.empty(),
      );
      when(() => watchListBloc.state).thenAnswer(
        (_) => const WatchListInitial(username: 'username'),
      );
    });

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
        bloc = NewsBloc(
          anilist: repository,
          settingsBloc: settingsBloc,
          watchListBloc: watchListBloc,
        );
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
        bloc = NewsBloc(
          anilist: repository,
          settingsBloc: settingsBloc,
          watchListBloc: watchListBloc,
        );
      },
    );
  });
}
