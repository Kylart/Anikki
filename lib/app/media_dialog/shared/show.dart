import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_media_portrait.dart';
import 'package:anikki/core/core.dart';

Future<void> showMediaDialog(
  BuildContext context,
  Media media, [
  LibraryEntry? libraryEntry,
]) async {
  if (context.landscape) {
    BlocProvider.of<HomeBloc>(context).add(
      HomeDrawerMediaChanged(
        media,
        libraryEntry,
      ),
    );
  } else if (context.portrait) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MediaDialogMediaPortrait(
            media: media,
            libraryEntry: libraryEntry,
          );
        },
      ),
    );
  }
}
