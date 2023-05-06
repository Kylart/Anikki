import 'dart:async';

import 'package:anikki/widgets/entry_card/entry_card_overlay.dart';
import 'package:flutter/material.dart';

import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/widgets/entry_card/entry_card_cover.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    this.actions = const [],
    required this.title,
    this.coverImage,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
    this.expandedWidget = const Card(),
  });

  final List<AnikkiAction> actions;
  final String title;
  final String? coverImage;
  final String? episode;
  final bool showBookmark;
  final bool showDone;
  final Widget expandedWidget;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  GlobalKey key = GlobalKey();
  OverlayEntry? overlayEntry;

  Timer? debounce;

  Size getWidgetSize(RenderBox box) {
    return box.size;
  }

  Size computeOverlaySize(Size widgetSize) {
    final height = widgetSize.height * 1.1;
    final width = height / 0.8;

    return Size(width, height);
  }

  Offset computePosition({
    required BuildContext context,
    required Offset position,
    required Size widgetSize,
    required Size overlaySize,
  }) {
    final screenSize = MediaQuery.of(context).size;

    double left = position.dx + ((widgetSize.width - overlaySize.width) / 2);
    double top = position.dy + ((widgetSize.height - overlaySize.height) / 2);

    if (left < 0) left = 0;
    if (top < 0) top = 0;

    if (top + overlaySize.height > screenSize.height) {
      top = screenSize.height - overlaySize.height;
    }
    if (left + overlaySize.width > screenSize.width) {
      left = screenSize.width - overlaySize.width;
    }

    return Offset(left, top);
  }

  void overlayAppear(BuildContext context) {
    final box = key.currentContext?.findRenderObject() as RenderBox;

    final widgetSize = getWidgetSize(box);
    final overlaySize = computeOverlaySize(widgetSize);

    final position = computePosition(
      context: context,
      position: box.localToGlobal(Offset.zero),
      widgetSize: widgetSize,
      overlaySize: overlaySize,
    );

    overlayEntry = OverlayEntry(
      builder: (context) {
        return SafeArea(
            child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                left: position.dx,
                top: position.dy,
                child: EntryCardOverlay(
                  onExpand: (size) {},
                  onExit: () {
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                  width: overlaySize.width,
                  height: overlaySize.height,
                  child: widget.expandedWidget,
                ),
              ),
            ],
          ),
        ));
      },
    );

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        debounce = Timer(const Duration(milliseconds: 700), () {
          overlayAppear(context);
        });
      },
      onExit: (_) => debounce?.cancel(),
      child: EntryCardCover(
        key: key,
        coverImage: widget.coverImage,
        showBookmark: widget.showBookmark,
        showDone: widget.showDone,
        episode: widget.episode,
      ),
    );
  }
}
