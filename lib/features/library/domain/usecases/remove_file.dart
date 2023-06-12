import 'package:anikki/features/library/domain/models/models.dart';

void removeFile(List<LibraryEntry> entries, LocalFile file) {
  final existsIndex =
      entries.indexWhere((element) => element.entries.contains(file));

  /// Should never happen
  if (existsIndex == -1) return;

  entries[existsIndex].entries.removeWhere((element) => element == file);

  if (entries[existsIndex].entries.isEmpty) {
    entries.removeAt(existsIndex);
  }
}
