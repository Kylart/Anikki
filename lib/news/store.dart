import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';

import 'package:anikki/providers/anilist/anilist_client.dart';

enum NewsLayouts {
  list,
  grid,
}

mixin NewsStore on AnilistClient, ChangeNotifier {
  List<ScheduleEntry> currentNews = [];
  Map<DateTimeRange, List<ScheduleEntry>> memoizedNews =
      LruMap(maximumSize: 10);

  Future<List<ScheduleEntry>> getNews(DateTimeRange range) async {
    if (memoizedNews[range] == null) {
      final news = await provider.getSchedule(range);
      memoizedNews[range] = news;
    }

    return memoizedNews[range]!;
  }

  NewsLayouts _newsLayout = NewsLayouts.grid;

  NewsLayouts get newsLayout => _newsLayout;

  set newsLayout(NewsLayouts value) {
    _newsLayout = value;
    notifyListeners();
  }
}
