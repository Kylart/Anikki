import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kawanime/providers/local/types/file.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class LocalStore with ChangeNotifier, DiagnosticableTreeMixin {
  String? currentPath;
  List<LocalFile> currentFiles = [];

  LocalStore({ this.currentPath }) {
    init();
  }

  Future<void> init() async {

    notifyListeners();
  }

  Future<void> retrieveFilesFromCurrentPath () async {
    if (currentPath == null) return;

    final directory = Directory(currentPath!);
    final exists = await directory.exists();

    if (!exists) throw Error();

    final files = directory.list(recursive: false, followLinks: false);

    await for (final file in files) {
      final path = file.path;

      final entry = LocalFile(path: path);

      currentFiles.add(entry);
    }
  }
}
