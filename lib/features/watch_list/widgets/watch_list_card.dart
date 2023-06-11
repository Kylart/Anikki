import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';

class WatchListCard extends StatelessWidget {
  const WatchListCard({
    super.key,
    required this.entry,
    required this.heroTag,
  });

  final Query$GetLists$MediaListCollection$lists$entries entry;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        '';

    return EntryCard(
      heroTag: heroTag,
      cover: EntryCardCover(
        heroTag: heroTag,
        coverImage: coverImage,
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
      ),
      media: entry.media!,
    );
  }
}
