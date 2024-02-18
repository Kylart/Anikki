import 'package:flutter/material.dart';

import 'package:anikki/app/home/shared/widgets/home_entry_card/home_entry_card.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HomeEntryCard(
            media: entry.media == null
                ? Media(anilistInfo: Fragment$shortMedia(id: 0))
                : entry.media!,
            libraryEntry: entry,
            text: entry.entries.length == 1
                ? entry.epMax?.toString()
                : '${entry.epMin ?? '?'} ~ ${entry.epMax ?? '?'}',
          ),
        ),
      ],
    );
  }
}
