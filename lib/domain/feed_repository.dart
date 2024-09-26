import 'package:flutter/material.dart';

import 'package:anikki/app/home/features/home_timelines/models/models.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

/// Repository to handle Feed related features
class FeedRepository {
  const FeedRepository({
    required this.anilist,
    required this.tmdb,
  });

  /// The [Anilist] API to use for this repository
  final Anilist anilist;

  /// The [TMDB] object to use to interact with TMDB.
  final Tmdb tmdb;

  /// Returns the release schedule for the given `range`
  Future<List<TimelineEntry>> getSchedule(
    DateTimeRange range, {
    List<int>? ids,
  }) async {
    late final List<TimelineEntry> result;

    if (ids != null) {
      final entries = await anilist.getScheduleFromIds(range, ids);

      result = entries
          .map(
            (entry) => TimelineEntry(
              type: TimelineType.feed,
              timestamp: entry.airingAt * 1000,
              media: Media(anilistInfo: entry.media),
              description: 'Episode ${entry.episode}',
            ),
          )
          .toList();
    } else {
      final entries = await anilist.getSchedule(range);

      result = entries
          .map(
            (entry) => TimelineEntry(
              type: TimelineType.feed,
              timestamp: entry.airingAt * 1000,
              media: Media(anilistInfo: entry.media),
              description: 'Episode ${entry.episode}',
            ),
          )
          .toList();
    }

    return result.reversed.toList();
  }

  /// Returns the trending entries
  Future<List<Media>> getTrending() async {
    final entries = await anilist.getTrending();

    return [
      for (final entry in entries)
        await tmdb.hydrateMediaWithTmdb(
          Media(anilistInfo: entry.media),
        ),
    ];
  }

  /// Returns recommended entries
  Future<List<Media>> getrecommendations() async {
    final entries = await anilist.getRecommendations();

    return [
      for (final entry in entries)
        await tmdb.hydrateMediaWithTmdb(
          Media(anilistInfo: entry.media),
        ),
    ];
  }

  /// Helper method to compute the default range for a schedule
  static DateTimeRange computeRange() {
    return DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now()
          .add(const Duration(days: 2))
          .copyWith(hour: 23, minute: 59, second: 59),
    );
  }
}
