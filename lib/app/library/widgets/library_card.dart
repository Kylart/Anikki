import 'package:anikki/data/data.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.entry,
    required this.heroTag,
  });

  final LibraryEntry entry;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return EntryCard(
      media: entry.media == null
          ? Media(anilistInfo: Fragment$shortMedia(id: 0))
          : entry.media!,
      libraryEntry: entry,
      cover: EntryCardCover(
        coverImage: entry.media?.coverImage,
        episode: entry.entries.length == 1
            ? entry.epMax?.toString()
            : '${entry.epMin ?? '?'} ~ ${entry.epMax ?? '?'}',
      ),
    );
  }
}
