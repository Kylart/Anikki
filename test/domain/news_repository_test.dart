import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: NewsRepository', () {
    late MockAnilist anilist;
    late NewsRepository repository;

    final range = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        const Duration(days: 1),
      ),
    );

    final scheduleMock = airingScheduleMock.Page!.airingSchedules!
        .whereType<Query$AiringSchedule$Page$airingSchedules>()
        .toList();

    group('getSchedule method', () {
      setUp(() {
        anilist = MockAnilist();
        when(() => anilist.getSchedule(range))
            .thenAnswer((_) async => scheduleMock);

        repository = NewsRepository(anilist);
      });

      test('returns valid entries', () async {
        final entries = await repository.getSchedule(range);

        expect(entries.length, scheduleMock.length);
        expect(
          entries.first.media,
          Media(anilistInfo: scheduleMock.first.media),
        );
        expect(entries.last.media, Media(anilistInfo: scheduleMock.last.media));
        expect(entries.first.episode, scheduleMock.first.episode);
        expect(entries.last.episode, scheduleMock.last.episode);
      });
    });

    group('filterEntries method', () {
      setUp(() {
        anilist = MockAnilist();
        repository = NewsRepository(anilist);
      });

      group('when showOnlyBookmarked property', () {
        test('is on alone', () {
          final result = repository.filterEntries(
            [
              ...currentEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
              ...plannedEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
              ...completedEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
            ],
            const NewsOptions(
              showOnlyBookmarked: true,
              showOnlyJap: false,
            ),
            WatchListComplete(
              username: username,
              watchList: watchListMapMock,
            ),
          );

          expect(
            result.length,
            currentEntriesMock.length + plannedEntriesMock.length,
          );
          expect(
            result.first.media.anilistInfo.id,
            currentEntriesMock.first.media?.id,
          );
        });
      });

      group('when showOnlyUnseen property', () {
        test('is on alone', () {
          final result = repository.filterEntries(
            [
              ...currentEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
              ...plannedEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
              ...completedEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
            ],
            const NewsOptions(
              showOnlyUnseen: true,
              showOnlyJap: false,
            ),
            WatchListComplete(
              username: username,
              watchList: watchListMapMock,
            ),
          );

          expect(
            result.length,
            currentEntriesMock.length + plannedEntriesMock.length,
          );
          expect(
            result.first.media.anilistInfo.id,
            currentEntriesMock.first.media?.id,
          );
        });

        test('is on with showOnlyBookmarked on', () {
          final result = repository.filterEntries(
            [
              ...currentEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
              ...plannedEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
              ...completedEntriesMock.map(
                (e) => NewsEntry(
                  media: Media(anilistInfo: e.media),
                  airingAt: DateTime.now(),
                ),
              ),
            ],
            const NewsOptions(
              showOnlyBookmarked: true,
              showOnlyUnseen: true,
              showOnlyJap: false,
            ),
            WatchListComplete(
              username: username,
              watchList: watchListMapMock,
            ),
          );

          expect(
            result.length,
            currentEntriesMock.length + plannedEntriesMock.length,
          );
          expect(
            result.first.media.anilistInfo.id,
            currentEntriesMock.first.media?.id,
          );
        });
      });

      group('when showAdult property', () {
        test('is on alone', () {
          final result = repository.filterEntries(
            [
              NewsEntry(
                media: Media(
                  anilistInfo: Fragment$shortMedia(id: 0, isAdult: true),
                ),
                airingAt: DateTime.now(),
              ),
              NewsEntry(
                media: Media(
                  anilistInfo: Fragment$shortMedia(id: 1, isAdult: false),
                ),
                airingAt: DateTime.now(),
              ),
            ],
            const NewsOptions(
              showAdult: true,
              showOnlyJap: false,
            ),
            WatchListComplete(
              username: username,
              watchList: watchListMapMock,
            ),
          );

          expect(result.length, 1);
          expect(result.first.media.anilistInfo.id, 0);
        });
      });

      group('when showOnlyJap property', () {
        test('is on alone', () {
          final result = repository.filterEntries(
            [
              NewsEntry(
                media: Media(
                  anilistInfo: Fragment$shortMedia(
                    id: 0,
                    countryOfOrigin: 'JP',
                  ),
                ),
                airingAt: DateTime.now(),
              ),
              NewsEntry(
                media: Media(
                  anilistInfo: Fragment$shortMedia(
                    id: 1,
                    countryOfOrigin: 'KR',
                  ),
                ),
                airingAt: DateTime.now(),
              ),
              NewsEntry(
                media: Media(
                  anilistInfo: Fragment$shortMedia(
                    id: 1,
                    countryOfOrigin: 'CN',
                  ),
                ),
                airingAt: DateTime.now(),
              ),
            ],
            const NewsOptions(),
            WatchListComplete(
              username: username,
              watchList: watchListMapMock,
            ),
          );

          expect(result.length, 1);
          expect(result.first.media.anilistInfo.id, 0);
        });
      });
    });

    group('computeRange method', () {
      test('computes a date range with valid borders', () {
        final range = NewsRepository.computeRange();

        expect(range.start.compareTo(DateTime.now()), -1);
        expect(range.end.compareTo(DateTime.now()), 1);
        expect(range.start.hour, 0);
        expect(range.start.minute, 0);
        expect(range.start.second, 0);
        expect(range.end.hour, 23);
        expect(range.end.minute, 59);
        expect(range.end.second, 59);
      });
    });
  });
}
