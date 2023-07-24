import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/app/entry_card_overlay/widgets/entry_card_overlay_media.dart';
import 'package:anikki/app/entry_card_overlay/widgets/entry_card_overlay_animation.dart';
import 'package:anikki/app/entry_card_overlay/widgets/entry_card_overlay_container.dart';

class EntryCardOverlayView extends StatelessWidget {
  const EntryCardOverlayView({
    super.key,
    required this.media,
    required this.anchorKey,
    this.isExpanded = false,
  });

  final Media media;
  final GlobalKey anchorKey;
  final bool isExpanded;

  Size _getWidgetSize(RenderBox box) {
    return box.size;
  }

  Size _computeOverlaySize(Size widgetSize) {
    double height = widgetSize.height * 1.1;

    if (height < 400) height = 350;

    double width = height / 0.8;

    return Size(width, height);
  }

  Offset _computePosition({
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

  @override
  Widget build(BuildContext context) {
    late Size overlaySize;
    late Offset position;

    if (isExpanded) {
      final screenSize = MediaQuery.of(context).size;
      overlaySize = Size(screenSize.width * 0.6, screenSize.height * 0.9);

      position = Offset(
        (screenSize.width - overlaySize.width) / 2,
        (screenSize.height - overlaySize.height) / 2,
      );
    } else {
      final box = anchorKey.currentContext?.findRenderObject() as RenderBox;

      final widgetSize = _getWidgetSize(box);
      overlaySize = _computeOverlaySize(widgetSize);

      position = _computePosition(
        context: context,
        position: box.localToGlobal(Offset.zero),
        widgetSize: widgetSize,
        overlaySize: overlaySize,
      );
    }

    return EntryCardOverlayContainer(
      child: EntryCardOverlayAnimation(
        size: overlaySize,
        position: position,
        child: EntryCardOverlayMedia(
          media: media,
          size: overlaySize,
        ),
      ),
    );
  }
}
