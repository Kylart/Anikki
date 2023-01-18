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
    // currentPath = "F:\\Anime\\[Despair-Paradise] Etotama";
    await retrieveFilesFromCurrentPath();

    notifyListeners();
  }

  Future<void> retrieveFilesFromCurrentPath() async {
    if (currentPath == null) return;

    final directory = Directory(currentPath!);
    final exists = await directory.exists();

    if (!exists) throw Error();

    final files = directory.list(recursive: false, followLinks: false);

    await for (final file in files) {
      final path = file.path;

      final parser = AnitomyParser(inputString: basename(path));
      final entry = LocalFile(
        path: path,
        episode: parser.episode,
        releaseGroup: parser.releaseGroup,
        title: parser.title,
      );

      currentFiles.add(entry);
    }

    final List<String> entryNames = [];

    for (final entry in currentFiles) {
      if (entry.title != null && !entryNames.contains(entry.title)) {
        entryNames.add(entry.title!);
      }
    }

    final info = await anilist.info.fromMultiple(entryNames);

    // Feeding medias to entries
    for (final file in currentFiles) {
      file.media = info[file.title != null ? getId(name: file.title!) : ''];
    }
  }
}
