import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';
import 'package:collection/collection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';

import '../../../fixtures/anilist.dart';

class UserListRepositoryMock extends Mock implements UserListRepository {}

void main() {
  group('unit test: WatchList Bloc', () {
    late WatchListBloc bloc;
    late UserListRepositoryMock repository;

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
          repository = UserListRepositoryMock();

          when(() => repository.getList(username))
              .thenAnswer((_) async => watchListClassMock);

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
          repository = UserListRepositoryMock();

          when(() => repository.getList(username))
              .thenThrow(AnilistGetListException(error: 'error'));

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
          repository = UserListRepositoryMock();
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
          watchList: AnilistWatchList(),
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
          repository = UserListRepositoryMock();

          when(
            () => repository.watchedEntry(
              episode: localFileMock.episode!,
              media: localFileMock.media!,
            ),
          ).thenAnswer((_) async {});

          when(() => repository.getList(username))
              .thenAnswer((_) async => watchListClassMock);

          bloc = WatchListBloc(repository);
        },
      );

      blocTest<WatchListBloc, WatchListState>(
        'emits [] when [WatchListWatched] is added but fails',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: AnilistWatchList(),
          connected: true,
        ),
        act: (bloc) => bloc.add(
          WatchListWatched(
            entry: localFileMock,
          ),
        ),
        expect: () => [],
        setUp: () {
          repository = UserListRepositoryMock();

          when(
            () => repository.watchedEntry(
              episode: localFileMock.episode!,
              media: localFileMock.media!,
            ),
          ).thenThrow(AnilistUpdateListException(error: 'error'));

          bloc = WatchListBloc(repository);
        },
      );

      blocTest<WatchListBloc, WatchListState>(
        'emits [] when [WatchListWatched] is added but app is not connected',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: AnilistWatchList(),
          connected: false,
        ),
        act: (bloc) => bloc.add(
          WatchListWatched(
            entry: localFileMock,
          ),
        ),
        expect: () => [],
        setUp: () {
          repository = UserListRepositoryMock();
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
          watchList: AnilistWatchList(),
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
          repository = UserListRepositoryMock();
          bloc = WatchListBloc(repository);
        },
      );

      blocTest<WatchListBloc, WatchListState>(
        'emits [WatchListLoading, WatchListComplete] when [WatchListAuthUpdated] is added but app just connected',
        build: () => bloc,
        seed: () => const WatchListComplete(
          username: username,
          watchList: AnilistWatchList(),
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
          repository = UserListRepositoryMock();

          when(() => repository.getList(username))
              .thenAnswer((_) async => watchListClassMock);

          bloc = WatchListBloc(repository);
        },
      );
    });
  });
}
