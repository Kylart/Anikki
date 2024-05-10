import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/media_details/widgets/media_details_media_portrait.dart';
import 'package:anikki/core/core.dart';

Future<void> showMediaDialog(
  BuildContext context,
  Media media, [
  LibraryEntry? libraryEntry,
]) async {
  if (context.landscape) {
    BlocProvider.of<LayoutBloc>(context).add(
      LayoutDrawerMediaChanged(
        media,
        libraryEntry,
      ),
    );
  } else if (context.portrait) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MediaDetailsPortrait(
            media: media,
            libraryEntry: libraryEntry,
          );
        },
      ),
    );
  }
}
