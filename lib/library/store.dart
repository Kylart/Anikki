import 'package:flutter/foundation.dart';

import 'package:anikki/library/repository.dart';
import 'package:anikki/models/local_file.dart';

class LocalStore with ChangeNotifier {
  List<LocalFile> files = [];
  String? lastPath;

  Future<List<LocalFile>> getFiles(String path) async {
    if (files.isEmpty) {
      files = await retrieveFilesFromPath(path: path);
      notifyListeners();
    }

    lastPath = path;

    return files;
  }

  void removeFile(LocalFile file) {
    files.removeWhere((element) => element == file);
    notifyListeners();
  }
}
