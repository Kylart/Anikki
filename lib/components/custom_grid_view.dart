import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/news/news_card.dart';
import 'package:anikki/library/library_card.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/watch_list/watch_list_card.dart';

class CustomGridView<T> extends StatelessWidget {
  final List<T> entries;

  const CustomGridView({
    super.key,
    required this.entries,
    this.gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 0.6,
    ),
  });

  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: entries.length,
      gridDelegate: gridDelegate,
      itemBuilder: (context, index) {
        final entry = entries[index];

        if (T == ScheduleEntry) {
          return NewsCard(entry: entry as ScheduleEntry);
        }

        if (T == LocalFile) {
          return LocalCard(entry: entry as LocalFile);
        }

        if (T == AnilistListEntry) {
          return WatchListCard(entry: entry as AnilistListEntry);
        }

        return const SizedBox();
      },
    );
  }
}
