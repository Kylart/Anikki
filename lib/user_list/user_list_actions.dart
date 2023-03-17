import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'package:anikki/components/fade_overlay.dart';
import 'package:anikki/components/video_player/desktop_player.dart';
import 'package:anikki/components/video_player/mobile_player.dart';
import 'package:anikki/components/video_player/video_player.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/watch_list/watch_list_edit.dart';

import '../providers/user_preferences/local_directory.dart';

deleteFile(LocalFile entry, BuildContext context) {
  showPlatformDialog<Dialog>(
    context: context,
    builder: (BuildContext context) {
      final navigator = Navigator.of(context);

      return PlatformAlertDialog(
        title: const Text('Delete file'),
        content: Text('Do you really want to delete ${entry.path}?'),
        actions: [
          PlatformTextButton(
            onPressed: () {
              entry.file.delete().then((value) {
                context.read<LocalStore>().removeFile(entry);
                navigator.pop();
              });
            },
            child: const Text("Yes!"),
          ),
          PlatformTextButton(
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
    await Future.wait([
      /// We need to escape the brackets because they are not escaped properly
      /// by OpenAppFile.
      OpenAppFile.open(
          entry.file.path.replaceAll('(', '\\(').replaceAll(')', '\\)')),
      _updateEntry(context, entry),
    ]);
  } else {
    Wakelock.enable();

    VideoPlayer player = isDesktop()
        ? DesktopPlayer<File>(input: entry.file)
        : MobilePlayer(input: entry.file);

    Navigator.of(context).push(
      FadeOverlay(
        child: player.widget(),
        onClose: () async => await Future.wait([
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
          SystemChrome.setPreferredOrientations([]),
          player.stop(),
          _updateEntry(context, entry),
          Wakelock.disable(),
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
      await store.provider.watchedEntry(
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

      store.refreshWatchLists();
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

void download<T>(BuildContext context, T entry) {
  showAvailableTorrents<T>(context, entry);
}

void openMediaInBrowser(String? url) {
  openInBrowser(url);
}

void showAnilistEdit(BuildContext context, AnilistListEntry entry) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: WatchListEdit(entry: entry),
      );
    },
  );
}

Future<void> updateFolderPath(BuildContext context) async {
  final localStore = context.read<LocalStore>();
  final preferences = context.read<LocalDirectory>();
  String? path = await FilePicker.platform.getDirectoryPath();

  if (path == null) return;

  preferences.path = path;
  localStore.files = [];
  localStore.getFiles(path);
}
