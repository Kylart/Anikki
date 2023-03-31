import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/entry_tile.dart';
import 'package:anikki/news/news_actions.dart';
import 'package:anikki/news/news_card.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/components/custom_list_view.dart';
import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/providers/user_preferences/news_layout.dart' as prefs;
import 'package:anikki/providers/user_preferences/news_layout.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key, required this.entries});

  final List<Query$AiringSchedule$Page$airingSchedules> entries;

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<prefs.NewsLayout>().layout;

    return NewsLayouts.grid == layout
        ? CustomGridView(
            entries: entries,
            builder: (entry) => NewsCard(entry: entry),
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) => EntryTile(
              entry: entry,
              subtitle: Text(
                'Episode ${entry.episode}',
              ),
              actions: getNewsActions(
                context: context,
                entry: entry,
                store: context.watch<AnilistStore>(),
              ),
              title: entry.media?.title?.userPreferred,
              coverImage: entry.media?.coverImage?.extraLarge ??
                  entry.media?.coverImage?.large ??
                  entry.media?.coverImage?.medium,
              bannerImage: entry.media?.bannerImage,
              tags: entry.media?.genres?.whereType<String>().toList(),
            ),
          );
  }
}
