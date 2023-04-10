import 'package:anikki/models/library_entry.dart';
import 'package:anikki/models/local_file.dart';

List<LibraryEntry> toLibraryEntry(List<LocalFile> files) {
  /// Grouping files which are the same
  final List<LibraryEntry> result = [];

  for (final file in files) {
    final exists = result.indexWhere((element) {
      /// Comparing media IDs if any
      /// This will most likely happen only when online
      if (element.media != null && file.media != null) {
        return element.media?.id == file.media?.id;
      }

      /// Fallback for if there is no medai to compare
      /// This should most likely happen on offline use
      /// Comparing parsed titles
      if (element.entries.first.title != null && file.title != null) {
        return element.entries.first.title! == file.title;
      }

      /// Otherwise, no assumption can be made, better be on the safe side
      /// even if it means not grouping entries together
      return false;
    });

    if (exists != -1) {
      /// Exists
      result[exists].entries.add(file);
    } else {
      /// Not there yet
      result.add(
        LibraryEntry(
          media: file.media,
          entries: [file],
        ),
      );
    }
  }

  return result;
}
