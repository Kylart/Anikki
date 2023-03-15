import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';

import 'package:anikki/providers/anilist/anilist_client.dart';

mixin NewsStore on AnilistClient, ChangeNotifier {
  List<ScheduleEntry> currentNews = [];
  Map<String, List<ScheduleEntry>> memoizedNews = LruMap(maximumSize: 10);

  Future<List<ScheduleEntry>> getNews(DateTimeRange range) async {
    if (memoizedNews[getKeyFromRange(range)] == null) {
      final news = await provider.getSchedule(range);
      memoizedNews[getKeyFromRange(range)] = news;
    }

    return memoizedNews[getKeyFromRange(range)]!;
  }
}

String getKeyFromRange(DateTimeRange range) {
  return '${range.start.day}-${range.start.month}-${range.start.year}/${range.end.day}-${range.end.month}-${range.end.year}';
}
