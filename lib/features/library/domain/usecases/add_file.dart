import 'package:anikki/features/library/domain/models/models.dart';
import 'package:anikki/features/library/domain/usecases/files.dart';

void addFile(List<LibraryEntry> entries, LocalFile file) {
  final existsIndex = entries.indexWhere(
    (element) => file.media != null
        ? element.media?.anilistInfo.id == file.media?.anilistInfo.id
        : element.entries.first.title == file.title,
  );

  if (existsIndex != -1) {
    entries[existsIndex].entries.add(file);
    entries[existsIndex]
        .entries
        .sort((a, b) => b.episode?.compareTo(a.episode ?? 0) ?? 0);
  } else {
    final newEntry = LibraryEntry(
      media: file.media,
      entries: [file],
    );

    if (entries.isEmpty) {
      entries.add(newEntry);
    } else {
      /// Looking where to insert the new entry
      for (int index = 0; index < entries.length; index++) {
        if (compareTitles(entries.elementAt(index), newEntry) > 0) {
          /// Means we need to place the new entry just the index before
          final insertIndex = index;

          entries.insert(
            insertIndex,
            newEntry,
          );

          break;
        }

        /// Means that the entry didn't fit before
        if (index == entries.length - 1) {
          entries.add(newEntry);
          break;
        }
      }
    }
  }
}
