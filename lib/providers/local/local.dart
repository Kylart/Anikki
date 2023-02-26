import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:anikki/helpers/hash.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/helpers/mixins/loading.dart';
import 'package:anikki/bindings/anitomy/anitomy.dart';
import 'package:anikki/providers/local/types/file.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class LocalStore with ChangeNotifier, DiagnosticableTreeMixin, LoadingMixin {
  String? currentPath;
  List<LocalFile> currentFiles = [];
  final anilist = AnilistStore();

  bool get hasEntries => currentFiles.isNotEmpty;

  LocalStore() {
    init();
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    currentPath = prefs.getString('user_preferences_localDirectory');

    if (currentPath != null || currentPath != '') {
      await retrieveFilesFromCurrentPath();

      notifyListeners();
    }
  }

  Future<void> setCurrentPath(String path) async {
    currentFiles = [];

    currentPath = path;
    await retrieveFilesFromCurrentPath();
  }

  Future<void> deleteFile(LocalFile file) async {
    await file.file.delete();
    currentFiles.removeWhere((element) => element == file);
    notifyListeners();
  }

  Future<void> playFile(LocalFile file) async {
    /// We need to escape the brackets because they are not escaped properly
    /// by OpenAppFile.
    await OpenAppFile.open(
        file.path.replaceAll('(', '\\(').replaceAll(')', '\\)'));
  }

  Future<void> retrieveFilesFromCurrentPath() async {
    try {
      isLoading = true;

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

      notifyListeners();

      final List<String> entryNames = [];

      for (final entry in currentFiles) {
        final title = entry.title;

        if (title != null && !entryNames.contains(title)) {
          entryNames.add(title);
        }
      }

      final info = await anilist.fromMultiple(entryNames);

      // Feeding medias to entries
      for (final file in currentFiles) {
        file.media = info[file.title != null ? getId(name: file.title!) : ''];
      }

      // Ordering files using name and episode
      _sortLocalEntries();

      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  void _sortLocalEntries() {
    currentFiles.sort((a, b) {
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
}
