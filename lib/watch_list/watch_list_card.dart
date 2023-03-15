import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/news/news_actions.dart';
import 'package:anikki/user_list/user_list_actions.dart';

class WatchListCard extends StatelessWidget {
  const WatchListCard({super.key, required this.entry});

  final AnilistListEntry entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media.coverImage?.extraLarge ??
        entry.media.coverImage?.large ??
        entry.media.coverImage?.medium;
    final title = entry.media.title?.title() ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: title,
      episode: [
        AnilistMediaListStatus.current,
        AnilistMediaListStatus.dropped,
        AnilistMediaListStatus.paused,
        AnilistMediaListStatus.repeating,
      ].contains(entry.status)
          ? entry.progress?.toString() ?? '?'
          : entry.score == 0
              ? '-'
              : entry.score.toString(),
      actions: [
        EntryCardAction(
            callback: (context) {
              showAvailableTorrents<AnilistListEntry>(context, entry);
            },
            icon: Icons.file_download,
            label: 'Show torrents'),
        EntryCardAction(
            callback: (context) {
              showAnilistEdit(context, entry);
            },
            icon: Icons.edit,
            label: 'Edit Watch list entry'),
        EntryCardAction(
            callback: (context) {
              openMediaInBrowser(entry.media.siteUrl);
            },
            icon: Icons.open_in_new,
            label: 'See on Anilist'),
      ],
    );
  }
}
