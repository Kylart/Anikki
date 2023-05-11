import 'dart:async';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/widgets/entry_card/entry_card_modal.dart';
import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_media.dart';
import 'package:anikki/helpers/screen_format.dart';
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

  void showOverlay(BuildContext context) {
    if (isPortrait(context)) {
      if (coverImage != null) {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return EntryCardModal(
                media: widget.media,
                libraryEntry: widget.libraryEntry,
              );
            },
          ),
        );
      }
    } else {
      BlocProvider.of<EntryCardOverlayBloc>(context).add(
        EntryCardOverlayRequested(
          key: key,
          context: context,
          child: EntryCardOverlayMedia(
            media: widget.media,
            isLibrary: widget.libraryEntry != null,
            entry: widget.libraryEntry,
            fallbackEpisodeNumber: widget.media.nextAiringEpisode?.episode ??
                widget.libraryEntry?.epMax ??
                widget.media.episodes ??
                0,
          ),
        ),
      );
    }
  }

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
      onTap: () => showOverlay(context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          debounce = Timer(const Duration(milliseconds: 700), () {
            showOverlay(context);
          });
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
