part of 'repository.dart';

Future<LocalFile> retrieveLocalFile({required String path}) async {
  final file = File(path);
  final parser = Anitomy(inputString: basename(path));
  LocalFile result = LocalFile(
    path: path,
    file: file,
    episode: parser.episode != null ? int.tryParse(parser.episode!) : null,
    releaseGroup: parser.releaseGroup,
    title: parser.title,
  );

  if (parser.title == null) return result;

  try {
    final anilist = Anilist(client: getAnilistClient());

    final info = await anilist.infoFromMultiple([result.title!]);

    result = result.copyWith(media: info.values.first);
  } on AnilistGetInfoException {
    logger.v('Could not retrieve file media info.');
  }

  return result;
}

Future<List<LocalFile>> retrieveFilesFromPath({required String path}) async {
  List<LocalFile> results = [];

  final directory = Directory(path);
  final exists = await directory.exists();

  if (!exists) throw LibraryDoesNotExistException();

  final fileStream = directory.list(recursive: true, followLinks: false);
  final files = await fileStream.toList();

  for (final file in files) {
    final path = file.path;
    final isAllowed = ['.mkv', '.mp4'].contains(extension(path));

    if (!isAllowed) continue;

    final parser = Anitomy(inputString: basename(path));
    final entry = LocalFile(
      path: path,
      file: File(path),
      episode: parser.episode != null ? int.tryParse(parser.episode!) : null,
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
    for (int index = 0; index < results.length; index++) {
      results[index] = results[index].copyWith(
        media: anilist.getInfoFromInfo(
          results[index].title!,
          info,
        ),
      );
    }
  } on AnilistGetInfoException {
    logger.v('Could not retrieve file media info.');
  }

  return results;
}

///
/// Compare local files by trying to compare 3 properties
/// 1. Media titles if any
/// 2. File parsed title if any
/// 3. Path
///
int compareTitles(LibraryEntry a, LibraryEntry b) {
  /// Comparing media titles first
  if (a.media?.title?.userPreferred != null &&
      b.media?.title?.userPreferred != null) {
    return a.media!.title!.userPreferred!
        .compareTo(b.media!.title!.userPreferred!);
  }

  if (a.entries.first.title != null && b.entries.first.title != null) {
    return a.entries.first.title!.compareTo(b.entries.first.title!);
  }

  return basename(a.entries.first.path).compareTo(b.entries.first.path);
}

void sortEntries(List<LibraryEntry> entries) {
  /// Sort with top level first based on path
  /// Sorting with path because title might not be parsable
  /// or plain up wrong.
  entries.sort(compareTitles);

  /// Then we have to sort all the `entries` of each `LibraryEntry`;
  /// Parsing with title and episode
  for (final entry in entries) {
    entry.entries.sort((a, b) {
      final aTitle = a.title ?? '';
      final bTitle = b.title ?? '';
      final aEp = a.episode ?? 0;
      final bEp = b.episode ?? 0;

      final comparisonResult = aTitle.compareTo(bTitle);

      if (comparisonResult != 0) {
        return comparisonResult;
      }

      return bEp.compareTo(aEp);
    });
  }
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

Future<void> playFile(LocalFile entry, BuildContext context,
    [bool playInside = false]) async {
  if (playInside) {
    await Future.wait([
      /// We need to escape the brackets because they are not escaped properly
      /// by OpenAppFile.
      OpenAppFile.open(
          entry.file.path.replaceAll('(', '\\(').replaceAll(')', '\\)')),
      updateEntry(context, entry),
    ]);
  } else {
    final libraryState =
        BlocProvider.of<LibraryBloc>(context).state as LibraryLoaded;

    AnikkiVideoPlayer player = AnikkiVideoPlayer(
      onVideoComplete: (media) {
        if (libraryState.playlist.contains(media.uri)) {
          /// We have to find the `LocalFile` that was just completed
          final entry = libraryState.entries.fold<List<LocalFile>>(
            [],
            (previousValue, element) => [
              ...previousValue,
              ...element.entries.reversed.map((e) => e),
            ],
          ).firstWhere((element) => element.path == media.uri);

          updateEntry(context, entry);
        }
      },
      first: entry,
      sources: libraryState.playlist,
    );

    Navigator.of(context).push(
      FadeOverlay(child: player.widget()),
    );
  }
}
