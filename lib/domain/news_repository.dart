import 'package:anikki/domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';

/// Repository to handle News related features
class NewsRepository {
  const NewsRepository(this.anilist);

  /// The [Anilist] API to use for this repository
  final Anilist anilist;

  /// Returns the release schedule for the given `range`
  Future<List<NewsEntry>> getSchedule(DateTimeRange range) async {
    final entries = await anilist.getSchedule(range);

    return entries
        .map(
          (e) => NewsEntry.fromAnilistSchedule(e),
        )
        .toList();
  }

  /// Filter the given `entries` by applying the given `options`
  List<NewsEntry> filterEntries(
    List<NewsEntry> entries,
    NewsOptions options,
    WatchListComplete? watchList,
  ) {
    return entries.where((entry) {
      bool included = true;

      if (watchList != null) {
        if (options.showOnlyBookmarked) {
          included = UserListRepository.isFollowed(watchList, entry);
        }

        if (options.showOnlyUnseen) {
          included = included &&
              UserListRepository.isFollowed(watchList, entry) &&
              !UserListRepository.isSeen(watchList, entry);
        }
      }

      if (options.showAdult) {
        included = included && entry.media.anilistInfo.isAdult == true;
      }

      if (options.showOnlyJap) {
        included = included && entry.media.anilistInfo.countryOfOrigin == 'JP';
      }

      return included;
    }).toList();
  }

  /// Helper method to compute the default range for a schedule
  static DateTimeRange computeRange() {
    return DateTimeRange(
      start: DateTime.now()
          .subtract(const Duration(days: 1))
          .copyWith(hour: 0, minute: 0, second: 0),
      end: DateTime.now()
          .add(const Duration(days: 1))
          .copyWith(hour: 23, minute: 59, second: 59),
    );
  }
}
