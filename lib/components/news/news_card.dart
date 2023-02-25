import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/news/news_card_actions.dart';
import 'package:anikki/components/shared/entry_card/entry_card.dart';
import 'package:anikki/components/shared/entry_card/entry_card_background.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.entry});

  final ScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.title() ?? 'N/A';

    bool showBookmark = false;
    bool showDone = false;
    final store = context.watch<AnilistStore>();

    if (store.isConnected && store.currentList.isNotEmpty) {
      final matchingEntries = store.currentList
          .where((e) => e.media.title?.title() == title)
          .toList();
      final currentListEntry =
          matchingEntries.isNotEmpty ? matchingEntries.first : null;

      if (currentListEntry != null) {
        if (currentListEntry.progress == null) {
          showBookmark = true;
        } else {
          if (entry.episode != null) {
            showDone = currentListEntry.progress! >= entry.episode!;
            showBookmark = !showDone;
          } else {
            showBookmark = true;
          }
        }
      }
    }

    if (store.isConnected && store.completedList.isNotEmpty && !showDone) {
      showDone = store.completedList
          .where((e) => e.media.title?.title() == title)
          .toList()
          .isNotEmpty;
    }

    return EntryCard(
      coverImage: coverImage,
      showBookmark: showBookmark,
      showDone: showDone,
      title: EntryCardBackground(
        title: title,
        episode: entry.episode?.toString(),
      ),
      actions: NewsCardActions(
        entry: entry,
        onBack: () {},
      ),
    );
  }
}
