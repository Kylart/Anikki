import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:anitomy/anitomy.dart';
import 'package:path/path.dart';

import 'package:anikki/helpers/errors/library_empty_directory_exception.dart';
import 'package:anikki/models/local_file.dart';

Future<List<LocalFile>> retrieveFilesFromPath({required String path}) async {
  final List<LocalFile> results = [];

  final directory = Directory(path);
  final exists = await directory.exists();

  if (!exists) throw LibraryEmptyDirectoryException();

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
  final Anilist anilist = Anilist();

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
