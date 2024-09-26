import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/app/home/features/home_timelines/models/timeline_entry.dart';
import 'package:anikki/app/home/features/home_timelines/models/timeline_type.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';
import '../fixtures/tmdb.dart';

void main() {
  group('unit test: FeedRepository', () {
    late MockAnilist anilist;
    late MockTmdb tmdb;
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

    final scheduleMockEntries = scheduleMock.map(
      (e) => TimelineEntry(
        type: TimelineType.feed,
        timestamp: e.airingAt * 1000,
        media: Media(anilistInfo: e.media),
        description: 'Episode ${e.episode}',
      ),
    )..toList();

    group('getSchedule method', () {
      setUp(() {
        anilist = MockAnilist();
        when(
          () => anilist.getSchedule(range),
        ).thenAnswer((_) async => scheduleMock);

        tmdb = MockTmdb();
        repository = FeedRepository(
          anilist: anilist,
          tmdb: tmdb,
        );
      });

      test('returns valid entries', () async {
        final entries = await repository.getSchedule(range);

        expect(entries.length, scheduleMockEntries.length);
        expect(
          entries.first,
          scheduleMockEntries.last,
        );
        expect(
          entries.last,
          scheduleMockEntries.first,
        );
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
