import 'package:flutter/material.dart';

import 'package:anikki/app/home/shared/widgets/home_entry_card/home_entry_card.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class WatchListCard extends StatelessWidget {
  const WatchListCard({
    super.key,
    required this.entry,
  });

  final Query$GetLists$MediaListCollection$lists$entries entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HomeEntryCard(
            media: Media(anilistInfo: entry.media),
            text: [
              Enum$MediaListStatus.CURRENT,
              Enum$MediaListStatus.DROPPED,
              Enum$MediaListStatus.PAUSED,
              Enum$MediaListStatus.REPEATING,
            ].contains(entry.status)
                ? entry.progress?.toString() ?? '?'
                : entry.score == 0
                    ? null
                    : entry.score.toString(),
          ),
        ),
      ],
    );
  }
}
