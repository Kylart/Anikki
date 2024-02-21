import 'package:flutter/material.dart';

import 'package:anikki/core/widgets/entry_card/entry_card.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.entry,
  });

  final LibraryEntry entry;

  @override
  Widget build(BuildContext context) {
    return EntryCard(
      media: entry.media == null
          ? Media(anilistInfo: Fragment$shortMedia(id: 0))
          : entry.media!,
      libraryEntry: entry,
      text: entry.entries.length == 1
          ? entry.epMax?.toString()
          : '${entry.epMin ?? '?'} ~ ${entry.epMax ?? '?'}',
    );
  }
}
