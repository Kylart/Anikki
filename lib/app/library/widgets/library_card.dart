import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/helpers/anilist/anilist_utils.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';

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
          ? Media(anilistInfo: AnilistUtils.getEmptyMedia())
          : entry.media!,
      libraryEntry: entry,
      text: entry.entries.length == 1
          ? entry.epMax?.toString()
          : '${entry.epMin ?? '?'} ~ ${entry.epMax ?? '?'}',
    );
  }
}
