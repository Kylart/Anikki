import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/app/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/app/entry_card_overlay/widgets/entry_card_overlay_media_portrait.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.media,
    required this.cover,
    this.libraryEntry,
  });

  /// [Media] this entry card is about
  final Media media;

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
      widget.media.title ?? widget.libraryEntry?.entries.first.title ?? 'N/A';

  String? get coverImage => widget.media.coverImage;

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      key: key,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state is LayoutLandscape) {
              BlocProvider.of<EntryCardOverlayBloc>(context).add(
                EntryCardOverlayRequested(
                  media: widget.media,
                  key: key,
                  isExpanded: true,
                ),
              );
            } else if (state is LayoutPortrait) {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return EntryCardOverlayMediaPortrait(
                      media: widget.media,
                    );
                  },
                ),
              );
            }
          },
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
      },
    );
  }
}
