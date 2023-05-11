import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_media.dart';
import 'package:anikki/helpers/screen_format.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry_card/entry_card_modal.dart';
import 'package:anilist/anilist.dart';

void showOverlay({
  required BuildContext context,
  required Fragment$shortMedia media,
  required LibraryEntry? libraryEntry,
  required GlobalKey key,
}) {
  if (isPortrait(context)) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return EntryCardModal(
            media: media,
            libraryEntry: libraryEntry,
          );
        },
      ),
    );
  } else {
    BlocProvider.of<EntryCardOverlayBloc>(context).add(
      EntryCardOverlayRequested(
        key: key,
        context: context,
        child: EntryCardOverlayMedia(
          media: media,
          isLibrary: libraryEntry != null,
          entry: libraryEntry,
          fallbackEpisodeNumber: media.nextAiringEpisode?.episode ??
              libraryEntry?.epMax ??
              media.episodes ??
              0,
        ),
      ),
    );
  }
}
