import 'package:flutter/foundation.dart';

import 'package:anikki/library/repository.dart';
import 'package:anikki/models/local_file.dart';

class LocalStore with ChangeNotifier {
  List<LocalFile> files = [];

  Future<List<LocalFile>> getFiles(String path) async {
    final currentFiles = await retrieveFilesFromPath(path: path);

    if (!listEquals(files, currentFiles)) {
      files = currentFiles;
    }

    return files;
  }

  void removeFile(LocalFile file) {
    files.removeWhere((element) => element == file);
    notifyListeners();
  }
}
