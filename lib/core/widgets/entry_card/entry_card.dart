import 'dart:async';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:anikki/features/library/domain/models/library_entry.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.media,
    required this.cover,
    required this.heroTag,
    this.libraryEntry,
  });

  /// [Media] this entry card is about
  final Media media;

  /// [LibraryEntry] for this card if any
  final LibraryEntry? libraryEntry;

  /// Cover to use for this card
  final EntryCardCover cover;

  /// [Hero] tag to use
  final String heroTag;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  final key = GlobalKey();

  Timer? debounce;

  String get title =>
      widget.media.title ?? widget.libraryEntry?.entries.first.title ?? 'N/A';

  String? get coverImage => widget.media.coverImage;

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
      onTap: () => BlocProvider.of<EntryCardOverlayBloc>(context).add(
        EntryCardOverlayRequested(
          media: widget.media,
          key: key,
          context: context,
        ),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          debounce = Timer(
            const Duration(milliseconds: 700),
            () {
              BlocProvider.of<EntryCardOverlayBloc>(context).add(
                EntryCardOverlayRequested(
                  media: widget.media,
                  key: key,
                  context: context,
                ),
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
