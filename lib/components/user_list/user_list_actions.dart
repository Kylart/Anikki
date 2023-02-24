import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/news/news_actions.dart';
import 'package:anikki/components/shared/fade_overlay.dart';
import 'package:anikki/components/shared/video_player/desktop_player.dart';
import 'package:anikki/components/shared/video_player/mobile_player.dart';
import 'package:anikki/components/shared/video_player/video_player.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/helpers/errors/anilist_update_list_exception.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/local/local.dart';
import 'package:anikki/providers/local/types/file.dart';

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
    final localStore = context.read<LocalStore>();

    await Future.wait([
      localStore.playFile(entry),
      _updateEntry(context, entry),
    ]);
  } else {
    VideoPlayer player = isDesktop()
        ? DesktopPlayer<File>(input: entry.file)
        : MobilePlayer(input: entry.file);

    Navigator.of(context).push(
      FadeOverlay(
        child: player.widget(),
        onClose: () async => Future.wait([
          player.stop(),
          _updateEntry(context, entry),
        ]),
      ),
    );
  }
}

Future<void> _updateEntry(BuildContext context, LocalFile entry) async {
  final store = context.read<AnilistStore>();
  final scaffold = ScaffoldMessenger.of(context);
  final theme = Theme.of(context);

  if (!store.isConnected) return;

  if (entry.media != null && entry.media!.id != null) {
    final episode = int.tryParse(entry.episode ?? '1') ?? 1;

    try {
      await store.watchedEntry(
        episode: episode,
        mediaId: entry.media!.id!,
      );

      scaffold.showSnackBar(
        SnackBar(
          backgroundColor: theme.colorScheme.background,
          content: ListTile(
            title: const Text('Anilist list updated!'),
            subtitle: Text(
                'Updated ${entry.media!.title?.title()} with episode $episode.'),
          ),
        ),
      );
    } on AnilistUpdateListException catch (e) {
      _handleAnilistUpdateException(e, context);
    }
  }
}

void _handleAnilistUpdateException(
    AnilistUpdateListException error, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      content: ListTile(
        title: Text(error.cause),
        subtitle: Text('Error was ${error.error}.'),
      ),
    ),
  );
}

void download<T> (BuildContext context, T entry) {
  showAvailableTorrents<T>(context, entry);
}