import 'dart:io';

import 'package:anikki/core/core.dart';
import 'package:path/path.dart';

class Files {
  Future<List<FileSystemEntity>> getFilesInDirectory(
    String path, [
    bool recursive = false,
  ]) async {
    final directory = Directory(path);
    final exists = await directory.exists();

    if (!exists) throw LibraryDoesNotExistException();

    final fileStream = directory.list(recursive: true, followLinks: false);
    final files = await fileStream.toList();

    return files
        .where(
          (element) => ['.mkv', '.mp4'].contains(extension(element.path)),
        )
        .toList();
  }
}
