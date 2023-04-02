import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:anitomy/anitomy.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart';
import 'package:wakelock/wakelock.dart';

import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/helpers/anilist_client.dart';
import 'package:anikki/providers/user_preferences/local_directory.dart';
import 'package:anikki/components/fade_overlay.dart';
import 'package:anikki/components/video_player/desktop_player.dart';
import 'package:anikki/components/video_player/mobile_player.dart';
import 'package:anikki/components/video_player/video_player.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/helpers/errors/library_directory_does_not_exist_exception.dart';
import 'package:anikki/models/local_file.dart';

Future<List<LocalFile>> retrieveFilesFromPath({required String path}) async {
  final List<LocalFile> results = [];

  final directory = Directory(path);
  final exists = await directory.exists();

  if (!exists) throw LibraryDoesNotExistException();

  final fileStream = directory.list(recursive: false, followLinks: false);
  final files = await fileStream.toList();

  for (final file in files) {
    final path = file.path;
    final isAllowed = ['.mkv', '.mp4'].contains(extension(path));

    if (!isAllowed) continue;

    final parser = Anitomy(inputString: basename(path));
    final entry = LocalFile(
      path: path,
      file: File(path),
      episode: parser.episode,
      releaseGroup: parser.releaseGroup,
      title: parser.title,
    );

    parser.dispose();

    results.add(entry);
  }

  final List<String> entryNames = [];

  try {
    final Anilist anilist = Anilist(client: getAnilistClient());

    for (final entry in results) {
      final title = entry.title;

      if (title != null && !entryNames.contains(title)) {
        entryNames.add(title);
      }
    }

    final info = await anilist.infoFromMultiple(entryNames);

    // Feeding medias to entries
    for (final file in results) {
      file.media = anilist.getInfoFromInfo(file.title!, info);
    }
  } on AnilistGetInfoException {
    /// TODO: Handle if not information on not connected
  }

  // Ordering files using name and episode
  _sortEntries(results);
  return results;
}

void _sortEntries(List<LocalFile> files) {
  files.sort((a, b) {
    final aTitle = a.title ?? '';
    final bTitle = b.title ?? '';
    final aEp = int.tryParse(a.episode ?? '0') ?? 0;
    final bEp = int.tryParse(b.episode ?? '0') ?? 0;

    final comparisonResult = aTitle.compareTo(bTitle);

    if (comparisonResult != 0) {
      return comparisonResult;
    }

    return bEp.compareTo(aEp);
  });
}

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
            child: const Text('Yes!'),
          ),
          PlatformTextButton(
            onPressed: navigator.pop,
            child: const Text('Nevermind'),
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
  final auth = BlocProvider.of<AnilistAuthBloc>(context);
  final lists = BlocProvider.of<WatchListBloc>(context);
  final scaffold = ScaffoldMessenger.of(context);
  final theme = Theme.of(context);
  final anilist = Anilist(client: getAnilistClient());

  if (!auth.isConnected) return;

  if (entry.media?.id != null) {
    final episode = int.tryParse(entry.episode ?? '1') ?? 1;

    try {
      await anilist.watchedEntry(
        episode: episode,
        mediaId: entry.media!.id,
      );

      scaffold.showSnackBar(
        SnackBar(
          backgroundColor: theme.colorScheme.background,
          content: ListTile(
            title: const Text('Anilist list updated!'),
            subtitle: Text(
                'Updated ${entry.media?.title?.userPreferred} with episode $episode.'),
          ),
        ),
      );

      lists.add(
        WatchListRequested(
            username: (auth.state as AnilistAuthSuccess).me.name),
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

Future<void> updateFolderPath(BuildContext context) async {
  final localStore = context.read<LocalStore>();
  final preferences = context.read<LocalDirectory>();
  String? path = await getDirectoryPath();

  if (path == null) return;

  preferences.path = path;
  localStore.files = [];
  localStore.getFiles(path);
}
