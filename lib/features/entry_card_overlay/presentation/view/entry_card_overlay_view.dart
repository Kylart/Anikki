import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_animation.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_container.dart';

class EntryCardOverlayView extends StatelessWidget {
  const EntryCardOverlayView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryCardOverlayBloc, EntryCardOverlayState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case EntryCardOverlayActive:
            final currentState = state as EntryCardOverlayActive;

            return EntryCardOverlayContainer(
              child: EntryCardOverlayAnimation(
                size: currentState.size,
                position: currentState.position,
                child: EntryCardOverlayMedia(media: currentState.media),
              ),
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
