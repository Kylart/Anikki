import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/news/helpers/news_actions.dart';
import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/helpers/anilist/filters/is_followed.dart';
import 'package:anikki/helpers/anilist/filters/is_seen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.entry});

  final Query$AiringSchedule$Page$airingSchedules entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.userPreferred ?? 'N/A';

    final isConnected = context.watch<AnilistAuthBloc>().isConnected;
    final listsState = context.watch<WatchListBloc>().state;

    bool showBookmark = false;
    bool showDone = false;

    if (isConnected && listsState.runtimeType == WatchListComplete) {
      final lists = listsState as WatchListComplete;

      showBookmark = isFollowed(lists, entry);

      if (isSeen(lists, entry)) {
        showBookmark = false;
        showDone = true;
      }

      if (lists.completed.isNotEmpty && !showDone) {
        showDone = lists.completed
            .where((e) => e.media?.title?.userPreferred == title)
            .toList()
            .isNotEmpty;
      }
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
      ),
    );
  }
}
