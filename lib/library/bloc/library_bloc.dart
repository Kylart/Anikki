import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart';
import 'package:watcher/watcher.dart';

import 'package:anikki/library/repository/repository.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/helpers/logger.dart';
import 'package:anikki/models/local_file.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final StateStreamableSource<SettingsState> settingsBloc;

  DirectoryWatcher? watcher;

  LibraryBloc({required this.settingsBloc}) : super(const LibraryInitial()) {
    on<LibraryEvent>((event, emit) {
      logger.v('Library event: ${event.runtimeType}');
    });

    on<LibraryUpdateRequested>(_onUpdateRequested);
    on<LibraryFileDeleted>(_onFileDeleted);
    on<LibraryFileAdded>(_onFileAdded);

    settingsBloc.stream.listen((settingsState) {
      final newPath = settingsState.settings.localDirectory;
      final currentPath = state.path;

      if (newPath != currentPath) {
        add(LibraryUpdateRequested(path: newPath));
      }
    });
  }

  void _setupWatcher(String path) {
    watcher = DirectoryWatcher(path);
    watcher?.events.listen((event) {
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
                file: File(event.path),
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
        emit(LibraryLoaded(entries: files, path: path));
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
    if (state is LibraryLoaded) {
      emit(
        LibraryLoaded(
          entries: (state as LibraryLoaded)
              .entries
              .whereNot((element) => element == event.file)
              .toList(),
          path: state.path,
        ),
      );
    }
  }

  Future<void> _onFileAdded(
      LibraryFileAdded event, Emitter<LibraryState> emit) async {
    if (state is LibraryLoaded) {
      final file = await retrieveLocalFile(path: event.path);
      final List<LocalFile> files = [
        ...List.from((state as LibraryLoaded).entries),
        file,
      ];

      sortEntries(files);

      emit(
        LibraryLoaded(
          entries: files,
          path: state.path,
        ),
      );
    }
  }
}
