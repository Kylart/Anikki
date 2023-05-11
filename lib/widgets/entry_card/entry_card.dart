import 'dart:async';

import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:anikki/features/entry_card_overlay/helpers/show_overlay.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry_card/entry_card_cover.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.media,
    required this.cover,
    this.libraryEntry,
  });

  /// [Fragment$shortMedia] this entry card is about
  final Fragment$shortMedia media;

  /// [LibraryEntry] for this card if any
  final LibraryEntry? libraryEntry;

  /// Cover to use for this card
  final EntryCardCover cover;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  final key = GlobalKey();

  Timer? debounce;

  String get title =>
      widget.media.title?.userPreferred ??
      widget.libraryEntry?.entries.first.title ??
      'N/A';

  String? get coverImage =>
      widget.media.coverImage?.extraLarge ??
      widget.media.coverImage?.large ??
      widget.media.coverImage?.medium;

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.2;

    return GestureDetector(
      key: key,
      onTap: () => showOverlay(
        context: context,
        media: widget.media,
        libraryEntry: widget.libraryEntry,
        key: key,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          debounce = Timer(
            const Duration(milliseconds: 700),
            () {
              showOverlay(
                context: context,
                media: widget.media,
                libraryEntry: widget.libraryEntry,
                key: key,
              );
            },
          );
        },
        onExit: (_) => debounce?.cancel(),
        child: Column(
          children: [
            Expanded(child: widget.cover),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              title: Tooltip(
                message: title,
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    '$title\n',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
