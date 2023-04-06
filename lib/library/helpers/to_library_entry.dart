import 'package:anikki/models/library_entry.dart';
import 'package:anikki/models/local_file.dart';

List<LibraryEntry> toLibraryEntry(List<LocalFile> files) {
  /// Grouping files which are the same
  final List<LibraryEntry> result = [];

  for (final file in files) {
    final exists =
        result.indexWhere((element) => element.media?.id == file.media?.id);

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
