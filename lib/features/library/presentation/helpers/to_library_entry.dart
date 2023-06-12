import 'package:anikki/features/library/domain/models/library_entry.dart';
import 'package:anikki/features/library/domain/models/local_file.dart';

/// Takes a list of `LocalFile` elements and maps them to a
/// list of `LibraryEntry`.
///
/// This helps group similar `LocalFile` together and is quite helpful
/// for the library feature.
///
/// To do so. The method tries to find similar `LocalFile` by matching
/// `file.media?.id` if not null. If there is no `media` property
/// on the `LocalFile`, it tries matching the parsed `title` property
/// if any.
///
/// Otherwise, no assumption can be made and no match can be found.
List<LibraryEntry> toLibraryEntry(List<LocalFile> files) {
  /// Grouping files which are the same
  final List<LibraryEntry> result = [];

  for (final file in files) {
    final exists = result.indexWhere((element) {
      /// Comparing media IDs if any
      /// This will most likely happen only when online
      if (element.media != null && file.media != null) {
        return element.media?.anilistInfo.id == file.media?.anilistInfo.id;
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
