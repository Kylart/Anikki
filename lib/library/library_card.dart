import 'package:anikki/library/library_card_actions.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/components/entry_card/entry_card_background.dart';
import 'package:anikki/models/local_file.dart';

class LocalCard extends StatelessWidget {
  const LocalCard({super.key, required this.entry});

  final LocalFile entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.title() ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: EntryCardBackground(
        title: title,
        episode: entry.episode?.toString(),
      ),
      actions: LocalCardActions(
        entry: entry,
        onBack: () {},
      ),
    );
  }
}
