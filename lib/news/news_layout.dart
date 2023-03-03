import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/news/news_list_view.dart';
import 'package:anikki/providers/user_preferences/news_layout.dart' as prefs;
import 'package:anikki/providers/user_preferences/news_layout.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key, required this.entries});

  final List<ScheduleEntry> entries;

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<prefs.NewsLayout>().layout;

    return NewsLayouts.grid == layout
        ? CustomGridView<ScheduleEntry>(
            entries: entries,
          )
        : NewsListView(
            entries: entries,
          );
  }
}
