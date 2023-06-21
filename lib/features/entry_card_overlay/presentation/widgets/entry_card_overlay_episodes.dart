import 'dart:math';

import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_episode/entry_card_overlay_episode.dart';
import 'package:anikki/features/library/domain/models/models.dart';

class EntryCardOverlayEpisodes extends StatelessWidget {
  const EntryCardOverlayEpisodes({
    super.key,
    required this.media,
    this.entry,
  });

  final Media media;
  final LibraryEntry? entry;

  int get numberOfEpisodes =>
      max(media.anilistInfo.episodes ?? 0, entry?.epMax ?? 0);

  @override
  Widget build(BuildContext context) {
    if (numberOfEpisodes == 0) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GridView.builder(
        itemCount: numberOfEpisodes,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 185,
          childAspectRatio: 0.75,
          crossAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          index = numberOfEpisodes - index;
          return EntryCardOverlayEpisode(
            index: index,
            media: media,
            entry: entry,
          );
        },
      ),
    );
  }
}
