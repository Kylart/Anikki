import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

part 'entry_card_overlay_state.dart';
part 'entry_card_overlay_event.dart';

class EntryCardOverlayBloc
    extends Bloc<EntryCardOverlayEvent, EntryCardOverlayState> {
  EntryCardOverlayBloc() : super(EntryCardOverlayEmpty()) {
    on<EntryCardOverlayEvent>((event, emit) {
      logger.v('EntryCardOverlayEvent event: ${event.runtimeType}');
    });

    on<EntryCardOverlayClosed>(_onClose);

    on<EntryCardOverlayRequested>(_onRequested);

    on<EntryCardOverlayExpanded>(_onExpanded);
  }

  void _onClose(
      EntryCardOverlayClosed event, Emitter<EntryCardOverlayState> emit) {
    if (state is! EntryCardOverlayActive) return;

    emit(EntryCardOverlayEmpty());
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

    emit(
      EntryCardOverlayActive(
        rootContext: event.context,
        media: event.media,
        key: event.key,
        position: position,
        size: overlaySize,
      ),
    );
  }

  void _onExpanded(
      EntryCardOverlayExpanded event, Emitter<EntryCardOverlayState> emit) {
    if (state is! EntryCardOverlayActive) return;

    final screenSize = MediaQuery.of(event.context).size;
    final overlaySize = Size(screenSize.width * 0.6, screenSize.height * 0.9);
    final overlayPosition = Offset(
      (screenSize.width - overlaySize.width) / 2,
      (screenSize.height - overlaySize.height) / 2,
    );

    emit(
      (state as EntryCardOverlayActive).copyWith(
        isExpanded: true,
        position: overlayPosition,
        size: overlaySize,
      ),
    );
  }

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
}
