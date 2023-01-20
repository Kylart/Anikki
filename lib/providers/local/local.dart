import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kawanime/helpers/hash.dart';
import 'package:open_app_file/open_app_file.dart';
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

  bool isLoading = false;

  LocalStore() {
    init();
  }

  Future<void> init() async {
    if (currentPath != null) {
      await retrieveFilesFromCurrentPath();

      notifyListeners();
    }
  }

  Future<void> setCurrentPath(String path) async {
    currentFiles = [];
    notifyListeners();

    currentPath = path;
    await retrieveFilesFromCurrentPath();
  }

  Future<void> deleteFile(LocalFile file) async {
    await file.file.delete();
    currentFiles.removeWhere((element) => element == file);
    notifyListeners();
  }

  Future<void> playFile(LocalFile file) async {
    await OpenAppFile.open(file.path);
  }

  Future<void> retrieveFilesFromCurrentPath() async {
    try {
      isLoading = true;
      notifyListeners();

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
          file: File(path),
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

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
