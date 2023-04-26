import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart';
import 'package:watcher/watcher.dart';

import 'package:anikki/features/library/helpers/to_library_entry.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/helpers/logger.dart';
import 'package:anikki/models/local_file.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final StateStreamableSource<SettingsState> settingsBloc;

  DirectoryWatcher? watcher;
  StreamSubscription<WatchEvent>? subscription;

  LibraryBloc({required this.settingsBloc}) : super(const LibraryInitial()) {
    on<LibraryEvent>((event, emit) {
      logger.v('Library event: ${event.runtimeType}');
    });

    on<LibraryUpdateRequested>(_onUpdateRequested);
    on<LibraryFileDeleted>(_onFileDeleted);
    on<LibraryFileAdded>(_onFileAdded);
    on<LibraryEntryExpanded>(_onEntryExpanded);

    settingsBloc.stream.listen((settingsState) {
      final newPath = settingsState.settings.localDirectory;
      final currentPath = state.path;

      if (newPath != currentPath) {
        add(LibraryUpdateRequested(path: newPath));
      }
    });
  }

  void _onEntryExpanded(
      LibraryEntryExpanded event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final s = state as LibraryLoaded;
      final List<bool> expanded = List.from(s.expandedEntries);

      expanded[event.index] = !expanded[event.index];

      emit(LibraryLoaded(
        path: s.path,
        entries: s.entries,
        expandedEntries: expanded,
      ));
    }
  }

  void _setupWatcher(String path) {
    subscription?.cancel();

    watcher = DirectoryWatcher(path);
    subscription = watcher?.events.listen((event) {
      switch (event.type) {
        case ChangeType.ADD:
          if (['.mkv', '.mp4'].contains(extension(event.path))) {
            add(
              LibraryFileAdded(path: event.path),
            );
          }
          break;

        case ChangeType.REMOVE:
          add(
            LibraryFileDeleted(
              file: LocalFile(
                path: event.path,
              ),
            ),
          );
          break;

        case ChangeType.MODIFY:
        default:
          break;
      }
    });
  }

  Future<void> _onUpdateRequested(
      LibraryUpdateRequested event, Emitter<LibraryState> emit) async {
    final path = event.path;

    emit(LibraryLoading(path: path));

    try {
      final files = await retrieveFilesFromPath(path: path);

      if (files.isEmpty) {
        emit(LibraryEmpty(path: path));
      } else {
        final entries = toLibraryEntry(files);

        sortEntries(entries);

        emit(
          LibraryLoaded(
            entries: entries,
            expandedEntries: entries.map((e) => e.entries.length == 1).toList(),
            path: path,
          ),
        );
      }

      _setupWatcher(path);
    } catch (e) {
      emit(
        LibraryError(
          message: e.toString(),
          path: path,
        ),
      );
    }
  }

  void _onFileDeleted(LibraryFileDeleted event, Emitter<LibraryState> emit) {
    if (state.runtimeType == LibraryLoaded) {
      final file = event.file;

      /// Find `file` in existing entries if any
      final currentState = state as LibraryLoaded;

      final entries = List<LibraryEntry>.from(currentState.entries);
      final expandedEntries = List<bool>.from(currentState.expandedEntries);

      final existsIndex =
          entries.indexWhere((element) => element.entries.contains(file));

      if (existsIndex != -1) {
        entries[existsIndex].entries.removeWhere((element) => element == file);

        if (entries[existsIndex].entries.isEmpty) {
          entries.removeAt(existsIndex);
          expandedEntries.removeAt(existsIndex);
        }

        if (entries[existsIndex].entries.length == 1) {
          expandedEntries[existsIndex] = true;
        }

        emit(
          LibraryLoaded(
            id: currentState.id + 1,
            entries: entries,
            expandedEntries: expandedEntries,
            path: state.path,
          ),
        );
      }
    }
  }

  Future<void> _onFileAdded(
      LibraryFileAdded event, Emitter<LibraryState> emit) async {
    if (state.runtimeType == LibraryLoaded) {
      final file = await retrieveLocalFile(path: event.path);

      /// Find `file` in existing entries if any
      final currentState = state as LibraryLoaded;

      List<LibraryEntry> entries =
          List<LibraryEntry>.from(currentState.entries);
      final expandedEntries = List<bool>.from(currentState.expandedEntries);

      final existsIndex = entries.indexWhere(
        (element) =>
            element.media?.id == file.media?.id ||
            element.entries.first.title == file.title,
      );

      if (existsIndex != -1) {
        entries[existsIndex].entries.add(file);

        /// Setting expanded to false if the entry went from 1 file to 2
        if (entries[existsIndex].entries.length == 2) {
          expandedEntries[existsIndex] = false;
        }
      } else {
        final newEntry = LibraryEntry(
          media: file.media,
          entries: [file],
        );

        /// Looking where to insert the new entry
        for (int index = 0; index < entries.length; index++) {
          if (compareTitles(entries.elementAt(index), newEntry) > 0) {
            /// Means we need to place the new entry just the index before
            final insertIndex = index;

            entries.insert(
              insertIndex,
              newEntry,
            );

            expandedEntries.insert(insertIndex, true);

            break;
          }
        }
      }

      emit(
        LibraryLoaded(
          id: currentState.id + 1,
          entries: entries,
          expandedEntries: expandedEntries,
          path: state.path,
        ),
      );
    }
  }
}
