import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';

void main() {
  group('unit test: UserListRepository', () {
    late MockAnilist anilist;
    late UserListRepository repository;

    group('watchedEntry method', () {
      group('when API succeeds', () {
        setUp(() {
          anilist = MockAnilist();
          when(
            () => anilist.updateEntry(
              episode: 1,
              mediaId: shortMediaMock.id,
              status: Enum$MediaListStatus.CURRENT,
            ),
          ).thenAnswer((_) async {});

          when(
            () => anilist.updateEntry(
              episode: 2,
              mediaId: shortMediaMock.id,
              status: null,
            ),
          ).thenAnswer((_) async {});

          repository = UserListRepository(anilist);
        });

        test('succeeds when episode is 1', () async {
          await repository.watchedEntry(episode: 1, media: anilistMediaMock);
        });

        test('succeeds when episode is not 1', () async {
          await repository.watchedEntry(episode: 2, media: anilistMediaMock);
        });
      });

      group('when API fails', () {
        final exception = Exception('error');

        setUp(() {
          anilist = MockAnilist();
          when(
            () => anilist.updateEntry(
              episode: 1,
              mediaId: shortMediaMock.id,
              status: Enum$MediaListStatus.CURRENT,
            ),
          ).thenThrow(exception);

          repository = UserListRepository(anilist);
        });

        test('fails with the same exception', () async {
          try {
            await repository.watchedEntry(episode: 1, media: anilistMediaMock);
            fail('Expected exception');
          } on Exception catch (e) {
            expect(e, exception);
          }
        });
      });
    });

    group('getList method', () {
      group('when API succeeds', () {
        setUp(() {
          anilist = MockAnilist();
          when(
            () => anilist.getWatchLists(username, useCache: false),
          ).thenAnswer((_) async => watchListClassMock);

          repository = UserListRepository(anilist);
        });

        test('succeeds', () async {
          final result = await repository.getList(username);

          expect(result, watchListClassMock);
        });
      });

      group('when API fails', () {
        final exception = Exception('error');

        setUp(() {
          anilist = MockAnilist();
          when(
            () => anilist.getWatchLists(username, useCache: false),
          ).thenThrow(exception);

          repository = UserListRepository(anilist);
        });

        test('fails with the same exception', () async {
          try {
            await repository.getList(username);
            fail('Expected exception');
          } on Exception catch (e) {
            expect(e, exception);
          }
        });
      });
    });
  });
}
