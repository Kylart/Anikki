import 'package:path/path.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class LocalStorageRepository {
  const LocalStorageRepository(
    this.anilist,
    this.files,
  );

  /// The [Anilist] API to use
  final Anilist anilist;

  /// The [Files] API to use
  final Files files;

  /// Delete a [LocalFile] from the device
  Future<void> deleteFile(LocalFile file) async {
    if (await file.file.exists()) {
      await file.file.delete();
    }
  }

  /// Finds files in the given `path`.
  /// Use `recursive` to choose whether the files should be found recusrively in
  /// the given `path` or not
  Future<List<LocalFile>> retrieveFiles(
    String path, [
    bool recursive = true,
  ]) async {
    final allFiles = await files.getFilesInDirectory(path, recursive);
    final results = allFiles.map((e) => LocalFile(path: e.path)).toList();

    return _hydrateFilesWithMedia(results);
  }

  /// Finds files in the given `path`.
  /// Use `recursive` to choose whether the files should be found recusrively in
  /// the given `path` or not
  Future<List<LibraryEntry>> retrieveFilesAsLibraryEntries(
    String path, [
    bool recursive = true,
  ]) async {
    final files = await retrieveFiles(path, recursive);
    var results = _toLibraryEntry(files);

    _sortEntries(results);

    return results;
  }

  /// Add a given [LocalFile] to the given [LibraryEntries] accordingly. Handles
  /// existing / matching entries and returns the updated list
  List<LibraryEntry> addFileToEntries(
      List<LibraryEntry> entries, LocalFile file) {
    final result = List<LibraryEntry>.from(entries);
    final existsIndex = result.indexWhere(
      (element) => file.media != null
          ? element.media?.anilistInfo.id == file.media?.anilistInfo.id
          : element.entries.first.title == file.title,
    );

    if (existsIndex != -1) {
      result[existsIndex].entries.add(file);
      result[existsIndex]
          .entries
          .sort((a, b) => b.episode?.compareTo(a.episode ?? 0) ?? 0);
    } else {
      final newEntry = LibraryEntry(
        media: file.media,
        entries: [file],
      );

      if (result.isEmpty) {
        result.add(newEntry);
      } else {
        /// Looking where to insert the new entry
        for (int index = 0; index < entries.length; index++) {
          if (_compareTitles(result.elementAt(index), newEntry) > 0) {
            /// Means we need to place the new entry just the index before
            final insertIndex = index;

            result.insert(
              insertIndex,
              newEntry,
            );

            break;
          }

          /// Means that the entry didn't fit before
          if (index == entries.length - 1) {
            result.add(newEntry);
            break;
          }
        }
      }
    }

    return result;
  }

  /// Remove the given `file` from the given `entries` and returns the updated
  /// list. If no file cannot be found, will return [Null]
  List<LibraryEntry>? removeFileFromEntries(
      List<LibraryEntry> entries, LocalFile file) {
    final result = List<LibraryEntry>.from(entries);
    final existsIndex =
        result.indexWhere((element) => element.entries.contains(file));

    /// Should never happen
    if (existsIndex == -1) return null;

    result[existsIndex].entries.removeWhere((element) => element == file);

    if (result[existsIndex].entries.isEmpty) {
      result.removeAt(existsIndex);
    }

    return result;
  }

  /// Updates given `files` with [Media] using the parsed name of the files and returns it.
  Future<List<LocalFile>> _hydrateFilesWithMedia(List<LocalFile> files) async {
    var results = List<LocalFile>.from(files);

    try {
      final entryNames = _getUniqNames(files);
      final info = await anilist.infoFromMultiple(entryNames);

      for (int index = 0; index < results.length; index++) {
        results[index] = results[index].copyWith(
          media: Media(
            anilistInfo: anilist.getInfoFromInfo(
              results[index].title!,
              info,
            ),
          ),
        );
      }

      return results;
    } on AnilistGetInfoException {
      logger.t('Could not retrieve file media info.');
      return files;
    }
  }

  /// Returns a [Set] of unique names from given [LocalFile]s
  List<String> _getUniqNames(List<LocalFile> files) {
    final List<String> entryNames = [];

    for (final entry in files) {
      final title = entry.title;

      if (title != null && !entryNames.contains(title)) {
        entryNames.add(title);
      }
    }

    return entryNames;
  }

  /// Sort the given `entries`
  /// This methods modifies its argument
  void _sortEntries(List<LibraryEntry> entries) {
    /// Sort with top level first based on path
    /// Sorting with path because title might not be parsable
    /// or plain up wrong.
    entries.sort(_compareTitles);

    /// Then we have to sort all the `entries` of each `LibraryEntry`;
    /// Parsing with title and episode
    for (final entry in entries) {
      entry.entries.sort((a, b) {
        final aTitle = a.title ?? '';
        final bTitle = b.title ?? '';
        final aEp = a.episode ?? 0;
        final bEp = b.episode ?? 0;

        final comparisonResult = aTitle.compareTo(bTitle);

        if (comparisonResult != 0) {
          return comparisonResult;
        }

        return bEp.compareTo(aEp);
      });
    }
  }

  /// Compare local files by trying to compare 3 properties
  /// 1. Media titles if any
  /// 2. File parsed title if any
  /// 3. Path
  int _compareTitles(LibraryEntry a, LibraryEntry b) {
    /// Comparing media titles first
    if (a.media?.title != null && b.media?.title != null) {
      return a.media!.title!.compareTo(b.media!.title!);
    }

    if (a.entries.first.title != null && b.entries.first.title != null) {
      return a.entries.first.title!.compareTo(b.entries.first.title!);
    }

    return basename(a.entries.first.path).compareTo(b.entries.first.path);
  }

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
  List<LibraryEntry> _toLibraryEntry(List<LocalFile> files) {
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
}
