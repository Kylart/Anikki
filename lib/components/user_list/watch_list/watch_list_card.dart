import 'package:flutter/material.dart';

import 'package:anikki/components/shared/entry_card/entry_card.dart';
import 'package:anikki/components/shared/entry_card/entry_card_background.dart';
import 'package:anikki/components/user_list/watch_list/watch_list_card_actions.dart';
import 'package:anikki/providers/anilist/types/list_entry.dart';
import 'package:anikki/providers/anilist/types/media_list_status.dart';

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
      title: EntryCardBackground(
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
      ),
      actions: WatchListCardActions(
        entry: entry,
        onBack: () {},
      ),
    );
  }
}
