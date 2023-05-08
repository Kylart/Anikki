import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_media.dart';
import 'package:anikki/widgets/entry_card/entry_card.dart';

class WatchListCard extends StatelessWidget {
  const WatchListCard({super.key, required this.entry});

  final Query$GetLists$MediaListCollection$lists$entries entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        '';
    final title = entry.media?.title?.userPreferred ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: title,
      episode: [
        Enum$MediaListStatus.CURRENT,
        Enum$MediaListStatus.DROPPED,
        Enum$MediaListStatus.PAUSED,
        Enum$MediaListStatus.REPEATING,
      ].contains(entry.status)
          ? entry.progress?.toString() ?? '?'
          : entry.score == 0
              ? '-'
              : entry.score.toString(),
      overlayWidget: EntryCardOverlayMedia(
        media: entry.media,
      ),
    );
  }
}
