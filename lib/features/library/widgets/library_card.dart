import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_media.dart';
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
    final title = entry.media?.title?.userPreferred ??
        entry.entries.first.title ??
        basename(entry.entries.first.path);

    return EntryCard(
      coverImage: coverImage,
      title: title,
      episode: episode,
      overlayWidget: EntryCardOverlayMedia(
        isLibrary: true,
        media: entry.media,
        entry: entry,
        fallbackEpisodeNumber: entry.epMax ?? 0,
      ),
    );
  }
}
