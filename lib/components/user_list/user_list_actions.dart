import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kawanime/components/shared/video_player/desktop_player.dart';
import 'package:kawanime/components/shared/video_player/mobile_player.dart';
import 'package:kawanime/components/shared/video_player/video_player.dart';
import 'package:kawanime/components/user_list/player_overlay.dart';
import 'package:kawanime/helpers/desktop_hooks.dart';
import 'package:kawanime/providers/local/local.dart';
import 'package:kawanime/providers/local/types/file.dart';
import 'package:provider/provider.dart';

deleteFile(LocalFile entry, BuildContext context) {
  final store = context.read<LocalStore>();

  showDialog<Dialog>(
    context: context,
    builder: (BuildContext context) {
      final navigator = Navigator.of(context);

      return AlertDialog(
        title: const Text('Delete file'),
        content: Text('Do you really want to delete ${entry.path}?'),
        actions: [
          TextButton(
            onPressed: () async {
              await store.deleteFile(entry);
              navigator.pop();
            },
            child: const Text("Yes!"),
          ),
          TextButton(
            onPressed: navigator.pop,
            child: const Text("Nevermind"),
          ),
        ],
      );
    },
  );
}

Future<void> playFile(LocalFile entry, BuildContext context) async {
  if (Platform.isMacOS) {
    final store = context.read<LocalStore>();
    await store.playFile(entry);
  } else {
    VideoPlayer player = isDesktop()
        ? DesktopPlayer<File>(input: entry.file)
        : MobilePlayer(input: entry.file);

    Navigator.of(context).push(
      PlayerOverlay(
        child: player.widget(),
        onClose: player.stop,
      ),
    );
  }
}
