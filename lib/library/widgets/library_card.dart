import 'package:flutter/material.dart';

import 'package:anikki/library/helpers/library_actions.dart';
import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/models/local_file.dart';

class LibraryCard extends StatefulWidget {
  const LibraryCard({
    super.key,
    required this.entry,
    this.episode,
    required this.isExpandable,
    required this.onTap,
  });

  final LocalFile entry;
  final String? episode;
  final bool isExpandable;
  final void Function() onTap;

  @override
  State<LibraryCard> createState() => _LibraryCardState();
}

class _LibraryCardState extends State<LibraryCard> {
  @override
  Widget build(BuildContext context) {
    final coverImage = widget.entry.media?.coverImage?.extraLarge ??
        widget.entry.media?.coverImage?.large ??
        widget.entry.media?.coverImage?.medium;
    final title =
        widget.entry.media?.title?.userPreferred ?? widget.entry.title ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: title,
      episode: widget.episode,
      isExpandable: widget.isExpandable,
      actions: widget.isExpandable
          ? geExpandabletLibraryActions(
              context: context,
              entry: widget.entry,
              onShrink: widget.onTap,
            )
          : getLibraryActions(context, widget.entry),
    );
  }
}
