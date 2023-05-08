import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:anikki/features/entry_card_overlay/helpers/overlay_action.dart';
import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/models/local_file.dart';

class EntryCardOverlayFileTile extends StatelessWidget {
  const EntryCardOverlayFileTile({
    super.key,
    required this.file,
  });

  final LocalFile file;

  @override
  Widget build(BuildContext context) {
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
      trailing: IconButton(
        onPressed: () {
          overlayAction(
            () => playFile(file, context),
            context,
          );
        },
        icon: const Icon(Icons.play_circle_outline),
      ),
      title: Text(
        file.episode == null
            ? file.title ?? basename(file.path)
            : 'Episode ${file.episode}',
      ),
    );
  }
}
