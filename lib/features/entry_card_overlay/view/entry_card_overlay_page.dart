import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/features/entry_card_overlay/view/entry_card_overlay_view.dart';

class EntryCardOverlayPage extends StatelessWidget {
  const EntryCardOverlayPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryCardOverlayBloc, EntryCardOverlayState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case EntryCardOverlayActive:
            final currentState = state as EntryCardOverlayActive;

            return EntryCardOverlayView(
              size: currentState.size,
              position: currentState.position,
              child: child,
            );
          case EntryCardOverlayEmpty:
          default:
            throw ErrorWidget.withDetails(
              message: 'Overlay required for wrong state.',
            );
        }
      },
    );
  }
}
