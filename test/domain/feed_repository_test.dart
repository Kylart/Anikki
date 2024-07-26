import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';

void main() {
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
        when(
          () => anilist.getSchedule(range),
        ).thenAnswer((_) async => scheduleMock);

        repository = FeedRepository(anilist);
      });

      test('returns valid entries', () async {
        final entries = await repository.getSchedule(range);

        expect(entries.length, scheduleMock.length);
        expect(
          entries.first,
          scheduleMock.first,
        );
        expect(
          entries.last,
          scheduleMock.last,
        );
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
              Query$AiringSchedule$Page$airingSchedules(
                id: 0,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                  id: 0,
                  isAdult: true,
                ),
              ),
              Query$AiringSchedule$Page$airingSchedules(
                id: 1,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                  id: 0,
                  isAdult: false,
                ),
              ),
            ].map((e) => Media(anilistInfo: e.media)).toList(),
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
              Query$AiringSchedule$Page$airingSchedules(
                id: 0,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                  id: 0,
                  isAdult: true,
                ),
              ),
              Query$AiringSchedule$Page$airingSchedules(
                id: 1,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                  id: 0,
                  isAdult: false,
                ),
              ),
            ].map((e) => Media(anilistInfo: e.media)).toList(),
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
              Query$AiringSchedule$Page$airingSchedules(
                id: 0,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                  id: 0,
                  isAdult: false,
                  countryOfOrigin: 'JP',
                ),
              ),
              Query$AiringSchedule$Page$airingSchedules(
                id: 1,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                  id: 0,
                  isAdult: false,
                  countryOfOrigin: 'KR',
                ),
              ),
              Query$AiringSchedule$Page$airingSchedules(
                id: 2,
                airingAt: 0,
                episode: 1,
                media: Fragment$shortMedia(
                    id: 0, isAdult: false, countryOfOrigin: 'CN'),
              ),
            ].map((e) => Media(anilistInfo: e.media)).toList(),
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

        expect(range.end.hour, 23);
        expect(range.end.minute, 59);
        expect(range.end.second, 59);
      });
    });
  });
}
