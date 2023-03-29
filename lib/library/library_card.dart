import 'package:flutter/material.dart';

import 'package:anikki/library/library_actions.dart';
import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/models/local_file.dart';

class LocalCard extends StatelessWidget {
  const LocalCard({super.key, required this.entry});

  final LocalFile entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media.coverImage?.extraLarge ??
        entry.media.coverImage?.large ??
        entry.media.coverImage?.medium;
    final title = entry.media.title?.title() ?? entry.title ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: title,
      episode: entry.episode?.toString(),
      actions: getLibraryActions(
        context,
        entry,
      ),
    );
  }
}
