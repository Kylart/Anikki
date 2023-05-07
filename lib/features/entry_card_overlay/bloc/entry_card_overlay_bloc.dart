import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/entry_card_overlay/view/entry_card_overlay_page.dart';
import 'package:anikki/helpers/logger.dart';

part 'entry_card_overlay_state.dart';
part 'entry_card_overlay_event.dart';

class EntryCardOverlayBloc
    extends Bloc<EntryCardOverlayEvent, EntryCardOverlayState> {
  EntryCardOverlayBloc() : super(EntryCardOverlayEmpty()) {
    on<EntryCardOverlayEvent>((event, emit) {
      logger.v('EntryCardOverlayEvent event: ${event.runtimeType}');
    });

    on<EntryCardOverlayClosed>((event, emit) {
      if (state is EntryCardOverlayActive) {
        (state as EntryCardOverlayActive).overlay.remove();

        emit(EntryCardOverlayEmpty());
      }
    });

    on<EntryCardOverlayRequested>(_onRequested);
  }

  void _onRequested(
      EntryCardOverlayRequested event, Emitter<EntryCardOverlayState> emit) {
    final box = event.key.currentContext?.findRenderObject() as RenderBox;

    final widgetSize = _getWidgetSize(box);
    final overlaySize = _computeOverlaySize(widgetSize);

    final position = _computePosition(
      context: event.context,
      position: box.localToGlobal(Offset.zero),
      widgetSize: widgetSize,
      overlaySize: overlaySize,
    );

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  color: Colors.black26,
                ),
                EntryCardOverlayPage(
                  child: event.child,
                ),
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(event.context).insert(overlayEntry);

    emit(
      EntryCardOverlayActive(
        key: event.key,
        position: position,
        size: overlaySize,
        overlay: overlayEntry,
      ),
    );
  }

  Size _getWidgetSize(RenderBox box) {
    return box.size;
  }

  Size _computeOverlaySize(Size widgetSize) {
    final height = widgetSize.height * 1.1;
    final width = height / 0.8;

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
}
