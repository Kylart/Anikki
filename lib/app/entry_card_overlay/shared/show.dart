import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/app/entry_card_overlay/widgets/entry_card_overlay_media.dart';
import 'package:anikki/app/entry_card_overlay/widgets/entry_card_overlay_media_portrait.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

Future<void> showMediaDialog(BuildContext context, Media media) async {
  final layout = BlocProvider.of<LayoutBloc>(context).state;
  if (layout is LayoutLandscape) {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: EntryCardOverlayMedia(
            media: media,
          ),
        );
      },
    );
  } else if (layout is LayoutPortrait) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return EntryCardOverlayMediaPortrait(
            media: media,
          );
        },
      ),
    );
  }
}
