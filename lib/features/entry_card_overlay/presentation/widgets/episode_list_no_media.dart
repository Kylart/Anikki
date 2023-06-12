import 'package:flutter/material.dart';

import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_file_tile.dart';
import 'package:anikki/features/library/domain/models/library_entry.dart';

class EpisodeListNoMedia extends StatelessWidget {
  const EpisodeListNoMedia({
    super.key,
    required this.entry,
  });

  final LibraryEntry entry;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return EntryCardOverlayFileTile(
          file: entry.entries.elementAt(index),
        );
      },
      separatorBuilder: (_, index) => const Divider(
        height: 1,
      ),
      itemCount: entry.entries.length,
    );
  }
}
