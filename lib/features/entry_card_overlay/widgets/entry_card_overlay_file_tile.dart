import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import 'package:anikki/features/entry_card_overlay/helpers/overlay_action.dart';
import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/models/local_file.dart';

class EntryCardOverlayFileTile extends StatelessWidget {
  const EntryCardOverlayFileTile({
    super.key,
    required this.file,
    this.listEntry,
  });

  final LocalFile file;
  final Query$GetLists$MediaListCollection$lists$entries? listEntry;

  @override
  Widget build(BuildContext context) {
    bool isSeen = listEntry?.progress != null &&
        file.episode != null &&
        listEntry!.progress! >= file.episode!;

    return ListTile(
      dense: true,
      leading: IconButton(
        onPressed: () {
          overlayAction(
            () => deleteFile(file, context),
            context,
          );
        },
        icon: const Icon(Icons.delete_outline),
        color: Colors.red,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSeen) const Icon(Icons.done),
          IconButton(
            onPressed: () {
              /// Trick to get the original card context that should still exist
              /// even when the overlay disapears.
              final ctx = (BlocProvider.of<EntryCardOverlayBloc>(context).state
                      as EntryCardOverlayActive)
                  .key
                  .currentContext;

              overlayAction(
                () => ctx == null ? null : playFile(file, ctx),
                context,
              );
            },
            icon: const Icon(Icons.play_circle_outline),
          ),
        ],
      ),
      title: Text(
        file.episode == null
            ? file.title ?? basename(file.path)
            : 'Episode ${file.episode}',
      ),
    );
  }
}
