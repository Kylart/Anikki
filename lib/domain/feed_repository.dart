import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

/// Repository to handle Feed related features
class FeedRepository {
  const FeedRepository(this.anilist);

  /// The [Anilist] API to use for this repository
  final Anilist anilist;

  /// Returns the release schedule for the given `range`
  Future<List<Query$AiringSchedule$Page$airingSchedules>> getSchedule(
      DateTimeRange range) async {
    return await anilist.getSchedule(range);
  }

  /// Returns the trending entries
  Future<List<Media>> getTrending() async {
    final entries = await anilist.getTrending();

    return entries
        .map(
          (e) => Media(anilistInfo: e.media),
        )
        .toList();
  }

  /// Returns recommended entries
  Future<List<Media>> getRecommandations() async {
    final entries = await anilist.getRecommandations();

    return entries
        .map(
          (e) => Media(anilistInfo: e.mediaRecommendation),
        )
        .toList();
  }

  // Filter the given `entries` by applying the given `options`
  List<Query$AiringSchedule$Page$airingSchedules> filterEntries(
    List<Query$AiringSchedule$Page$airingSchedules> entries,
    HomeFeedOptions options,
  ) {
    return entries.where((entry) {
      bool included = true;

      if (!options.showAdult) {
        included = included && entry.media?.isAdult == false;
      }

      if (options.showOnlyJap) {
        included = included && entry.media?.countryOfOrigin == 'JP';
      }

      return included;
    }).toList();
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
