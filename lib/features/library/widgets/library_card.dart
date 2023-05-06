import 'package:anikki/features/library/widgets/library_card_overlay.dart';
import 'package:flutter/material.dart';

import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry_card/entry_card.dart';

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.entry,
    this.episode,
    required this.isExpandable,
    required this.onTap,
  });

  final LibraryEntry entry;
  final String? episode;
  final bool isExpandable;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;

    return EntryCard(
      coverImage: coverImage,
      title: '',
      episode: episode,
      expandedWidget: LibraryCardOverlay(
        entry: entry,
      ),
    );
  }
}
