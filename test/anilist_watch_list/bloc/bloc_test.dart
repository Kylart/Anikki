import 'package:collection/collection.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';

import '../../fixtures/anilist.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: WatchList Bloc', () {
    late MockGraphQLClient mockGraphQLClient;
    late WatchListBloc bloc;
    late Anilist repository;

    group('on [WatchListRequested],', () {
      blocTest(
        'emits [WatchListLoading, WatchListComplete] when [WatchListRequested] is added',
        build: () => bloc,
        act: (bloc) => bloc.add(
          const WatchListRequested(
            username: username,
          ),
        ),
        expect: () => [
          const WatchListLoading(username: username),
          isA<WatchListComplete>()
              .having(
                (p0) => p0.current.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.CURRENT,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.planning.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.PLANNING,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.completed.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.COMPLETED,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.dropped.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.DROPPED,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.paused.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.PAUSED,
                    )
                    ?.entries
                    ?.length,
              ),
        ],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();

          final result = generateMockQuery<Query$GetLists>(mockGraphQLClient);
          when(() => result.hasException).thenReturn(false);
          when(() => result.parsedData).thenReturn(watchListMock);

          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );

      blocTest(
        'emits [WatchListLoading, WatchListError] when [WatchListRequested] is added but fails',
        build: () => bloc,
        act: (bloc) => bloc.add(
          const WatchListRequested(
            username: username,
          ),
        ),
        expect: () => [
          const WatchListLoading(username: username),
          isA<WatchListError>()
              .having(
                (p0) => p0.username,
                'has right range',
                username,
              )
              .having(
                (p0) => p0.message,
                'with an error message',
                isNotNull,
              ),
        ],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();

          final result = generateMockQuery<Query$GetLists>(mockGraphQLClient);
          when(() => result.hasException).thenReturn(true);
          when(() => result.exception).thenReturn(OperationException());

          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );
    });

    group('on [WatchListReset]', () {
      blocTest(
        'emits [WatchListInitial] when [WatchListReset] is added',
        build: () => bloc,
        act: (bloc) => bloc.add(
          WatchListReset(),
        ),
        expect: () => [
          const WatchListInitial(
            username: null,
            connected: false,
          ),
        ],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();
          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );
    });

    group('on [WatchListWatched]', () {
      blocTest<WatchListBloc, WatchListState>(
        'emits [WatchListLoading, WatchListComplete] when [WatchListWatched] is added',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: {},
          connected: true,
        ),
        act: (bloc) => bloc.add(
          WatchListWatched(
            entry: localFileMock,
          ),
        ),
        expect: () => [
          const WatchListLoading(username: username),
          isA<WatchListComplete>()
        ],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();

          final mutationResult =
              generateMockMutation<Mutation$UpdateEntry>(mockGraphQLClient);
          when(() => mutationResult.hasException).thenReturn(false);
          when(() => mutationResult.parsedData).thenReturn(watchListUpdateMock);

          final queryResult =
              generateMockQuery<Query$GetLists>(mockGraphQLClient);
          when(() => queryResult.hasException).thenReturn(false);
          when(() => queryResult.parsedData).thenReturn(watchListMock);

          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );

      blocTest<WatchListBloc, WatchListState>(
        'emits [] when [WatchListWatched] is added but fails',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: {},
          connected: true,
        ),
        act: (bloc) => bloc.add(
          WatchListWatched(
            entry: localFileMock,
          ),
        ),
        expect: () => [],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();

          final mutationResult =
              generateMockMutation<Mutation$UpdateEntry>(mockGraphQLClient);
          when(() => mutationResult.hasException).thenReturn(true);
          when(() => mutationResult.exception).thenReturn(OperationException());

          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );

      blocTest<WatchListBloc, WatchListState>(
        'emits [] when [WatchListWatched] is added but app is not connected',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: {},
          connected: false,
        ),
        act: (bloc) => bloc.add(
          WatchListWatched(
            entry: localFileMock,
          ),
        ),
        expect: () => [],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();

          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );
    });
    group('on [WatchListAuthUpdated]', () {
      blocTest<WatchListBloc, WatchListState>(
        'emits [WatchListInitial] when [WatchListAuthUpdated] is added but app just disconnected',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: {},
          connected: false,
        ),
        act: (bloc) => bloc.add(
          WatchListAuthUpdated(
            connected: false,
            username: null,
          ),
        ),
        expect: () => [
          const WatchListInitial(
            username: null,
            connected: false,
          ),
        ],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();
          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );

      blocTest<WatchListBloc, WatchListState>(
        'emits [WatchListLoading, WatchListComplete] when [WatchListAuthUpdated] is added but app just connected',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: {},
          connected: false,
        ),
        act: (bloc) => bloc.add(
          WatchListAuthUpdated(
            connected: true,
            username: username,
          ),
        ),
        expect: () => [
          const WatchListLoading(username: username),
          isA<WatchListComplete>()
              .having(
                (p0) => p0.current.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.CURRENT,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.planning.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.PLANNING,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.completed.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.COMPLETED,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.dropped.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.DROPPED,
                    )
                    ?.entries
                    ?.length,
              )
              .having(
                (p0) => p0.paused.length,
                'with the right amount of current entries',
                watchListMock.MediaListCollection?.lists
                    ?.firstWhereOrNull(
                      (element) =>
                          element?.entries?.first?.status ==
                          Enum$MediaListStatus.PAUSED,
                    )
                    ?.entries
                    ?.length,
              ),
        ],
        setUp: () {
          mockGraphQLClient = generateMockGraphQLClient();

          final result = generateMockQuery<Query$GetLists>(mockGraphQLClient);
          when(() => result.hasException).thenReturn(false);
          when(() => result.parsedData).thenReturn(watchListMock);

          repository = Anilist(client: mockGraphQLClient);
          bloc = WatchListBloc(repository);
        },
      );
    });
  });
}
