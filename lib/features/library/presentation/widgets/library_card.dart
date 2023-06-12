import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/features/library/domain/models/library_entry.dart';
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
      media: entry.media == null ? Fragment$shortMedia(id: 0) : entry.media!,
      libraryEntry: entry,
      heroTag: heroTag,
      cover: EntryCardCover(
        heroTag: heroTag,
        coverImage: entry.media?.coverImage?.extraLarge ??
            entry.media?.coverImage?.large ??
            entry.media?.coverImage?.medium,
        episode: entry.entries.length == 1
            ? entry.epMax?.toString()
            : '${entry.epMin ?? '?'} ~ ${entry.epMax ?? '?'}',
      ),
    );
  }
}
