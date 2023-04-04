part of 'repository.dart';

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
    logger.v('Could not retrieve file media info, offline.');
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
                BlocProvider.of<LibraryBloc>(context).add(
                  LibraryFileDeleted(file: entry),
                );
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
      updateEntry(context, entry),
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
          updateEntry(context, entry),
          Wakelock.disable(),
        ]),
      ),
    );
  }
}
