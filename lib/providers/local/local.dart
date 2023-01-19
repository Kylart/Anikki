import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kawanime/helpers/hash.dart';
import 'package:path/path.dart';

import 'package:kawanime/bindings/anitomy/anitomy.dart';
import 'package:kawanime/providers/anilist/standalone.dart';
import 'package:kawanime/providers/local/types/file.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class LocalStore with ChangeNotifier, DiagnosticableTreeMixin {
  String? currentPath;
  List<LocalFile> currentFiles = [];
  final anilist = AnilistStandalone();

  bool get hasEntries => currentFiles.isNotEmpty;

  LocalStore() {
    init();
  }

  Future<void> init() async {
    if (currentPath != null) {
      await retrieveFilesFromCurrentPath();

      notifyListeners();
    }
  }

  Future<void> setCurrentPath (String path) async {
    currentFiles = [];
    currentPath = path;
    await retrieveFilesFromCurrentPath();
  }

  Future<void> retrieveFilesFromCurrentPath() async {
    if (currentPath == null) return;

    final directory = Directory(currentPath!);
    final exists = await directory.exists();

    if (!exists) throw Error();

    final fileStream = directory.list(recursive: false, followLinks: false);
    final files = await fileStream.toList();

    for (final file in files) {
      final path = file.path;
      final isAllowed = ['.mkv', '.mp4'].contains(extension(path));

      if (!isAllowed) continue;

      final parser = AnitomyParser(inputString: basename(path));
      final entry = LocalFile(
        path: path,
        episode: parser.episode,
        releaseGroup: parser.releaseGroup,
        title: parser.title,
      );

      parser.dispose();

      currentFiles.add(entry);
    }

    final List<String> entryNames = [];

    for (final entry in currentFiles) {
      final title = entry.title;

      if (title != null && !entryNames.contains(title)) {
        entryNames.add(title);
      }
    }

    final info = await anilist.info.fromMultiple(entryNames);

    // Feeding medias to entries
    for (final file in currentFiles) {
      file.media = info[file.title != null ? getId(name: file.title!) : ''];
    }

    notifyListeners();
  }
}
