import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: FeedRepository', () {
    late MockAnilist anilist;
    late FeedRepository repository;

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

        repository = FeedRepository(anilist);
      });

      test('returns valid entries', () async {
        final entries = await repository.getSchedule(range);

        expect(entries.length, scheduleMock.length);
        expect(entries.first, Media(anilistInfo: scheduleMock.first.media));
        expect(entries.last, Media(anilistInfo: scheduleMock.last.media));
      });
    });

    group('filterEntries method', () {
      setUp(() {
        anilist = MockAnilist();
        repository = FeedRepository(anilist);
      });

      group('when showAdult property', () {
        test('is on', () {
          final result = repository.filterEntries(
            [
              Media(
                anilistInfo: Fragment$shortMedia(id: 0, isAdult: true),
              ),
              Media(
                anilistInfo: Fragment$shortMedia(id: 1, isAdult: false),
              ),
            ],
            const HomeFeedOptions(
              showAdult: true,
              showOnlyJap: false,
            ),
          );

          expect(result.length, 2);
          expect(result.first.anilistInfo.id, 0);
          expect(result.first.anilistInfo.isAdult, true);
        });

        test('is off', () {
          final result = repository.filterEntries(
            [
              Media(
                anilistInfo: Fragment$shortMedia(id: 0, isAdult: true),
              ),
              Media(
                anilistInfo: Fragment$shortMedia(id: 1, isAdult: false),
              ),
            ],
            const HomeFeedOptions(
              showAdult: false,
              showOnlyJap: false,
            ),
          );

          expect(result.length, 1);
          expect(result.first.anilistInfo.id, 1);
          expect(result.first.anilistInfo.isAdult, false);
        });
      });

      group('when showOnlyJap property', () {
        test('is on alone', () {
          final result = repository.filterEntries(
            [
              Media(
                anilistInfo: Fragment$shortMedia(
                  id: 0,
                  countryOfOrigin: 'JP',
                  isAdult: false,
                ),
              ),
              Media(
                anilistInfo: Fragment$shortMedia(
                  id: 1,
                  countryOfOrigin: 'KR',
                  isAdult: false,
                ),
              ),
              Media(
                anilistInfo: Fragment$shortMedia(
                  id: 1,
                  countryOfOrigin: 'CN',
                  isAdult: false,
                ),
              ),
            ],
            const HomeFeedOptions(),
          );

          expect(result.length, 1);
          expect(result.first.anilistInfo.id, 0);
        });
      });
    });

    group('computeRange method', () {
      test('computes a date range with valid borders', () {
        final range = FeedRepository.computeRange();

        expect(range.start.day, DateTime.now().day + 1);
        expect(range.end.day, DateTime.now().day + 2);
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
