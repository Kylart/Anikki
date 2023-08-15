import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/view/home_view.dart';
import 'package:anikki/app/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/app/entry_card_overlay/view/entry_card_overlay_view.dart';
import 'package:anikki/core/widgets/macos_title_bar.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeView(),
        BlocBuilder<EntryCardOverlayBloc, EntryCardOverlayState>(
          builder: (context, state) {
            if (state is! EntryCardOverlayActive) return const SizedBox();

            return EntryCardOverlayView(
              media: state.media,
              anchorKey: state.key,
              isExpanded: state.isExpanded,
            );
          },
        ),
        if (Platform.isMacOS) const MacosTitleBar(),
      ],
    );
  }
}
