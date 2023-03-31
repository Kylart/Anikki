
import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/news/news_actions.dart';
import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/helpers/anilist/filters/is_followed.dart';
import 'package:anikki/helpers/anilist/filters/is_seen.dart';
import 'package:anikki/providers/anilist/anilist.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.entry});

  final Query$AiringSchedule$Page$airingSchedules entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.userPreferred ?? 'N/A';

    final store = context.watch<AnilistStore>();
    bool showBookmark = false;
    bool showDone = false;

    if (store.isConnected) {
      showBookmark = isFollowed(store, entry);

      if (isSeen(store, entry)) {
        showBookmark = false;
        showDone = true;
      }
    }

    if (store.isConnected && store.completedList.isNotEmpty && !showDone) {
      showDone = store.completedList
          .where((e) => e.media?.title?.userPreferred == title)
          .toList()
          .isNotEmpty;
    }

    return EntryCard(
      coverImage: coverImage,
      showBookmark: showBookmark,
      showDone: showDone,
      title: title,
      episode: entry.episode.toString(),
      actions: getNewsActions(
        context: context,
        entry: entry,
        store: store,
      ),
    );
  }
}
