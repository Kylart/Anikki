import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry_card/entry_card.dart';

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.entry,
  });

  final LibraryEntry entry;

  @override
  Widget build(BuildContext context) {
    return EntryCard(
      media: entry.media == null ? Fragment$shortMedia(id: 0) : entry.media!,
      libraryEntry: entry,
      cover: EntryCardCover(
        coverImage: entry.media?.coverImage?.extraLarge ??
            entry.media?.coverImage?.large ??
            entry.media?.coverImage?.medium,
        episode: entry.entries.length == 1
            ? entry.epMax?.toString()
            : '${entry.epMin} ~ ${entry.epMax}',
      ),
    );
  }
}
