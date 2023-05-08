import 'dart:async';

import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:flutter/material.dart';

import 'package:anikki/widgets/entry_card/entry_card_cover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.title,
    this.coverImage,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
    this.overlayWidget = const Card(),
  });

  final String title;
  final String? coverImage;
  final String? episode;
  final bool showBookmark;
  final bool showDone;
  final Widget overlayWidget;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  GlobalKey key = GlobalKey();
  OverlayEntry? overlayEntry;

  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: key,
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        debounce = Timer(const Duration(milliseconds: 700), () {
          BlocProvider.of<EntryCardOverlayBloc>(context).add(
            EntryCardOverlayRequested(
              key: key,
              context: context,
              child: widget.overlayWidget,
            ),
          );
        });
      },
      onExit: (_) => debounce?.cancel(),
      child: Column(
        children: [
          Expanded(
            child: EntryCardCover(
              coverImage: widget.coverImage,
              showBookmark: widget.showBookmark,
              showDone: widget.showDone,
              episode: widget.episode,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            title: Tooltip(
              message: widget.title,
              child: Opacity(
                opacity: 0.8,
                child: Text(
                  '${widget.title}\n',
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
    );
  }
}
