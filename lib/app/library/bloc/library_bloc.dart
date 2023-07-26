import 'dart:async';
import 'dart:io';

import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:watcher/watcher.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  DirectoryWatcher? watcher;
  StreamSubscription<WatchEvent>? subscription;

  final LocalStorageRepository repository;

  LibraryBloc(this.repository) : super(const LibraryInitial()) {
    on<LibraryEvent>((event, emit) {
      logger.v('Library event: ${event.runtimeType}');
    });

    on<LibraryUpdateRequested>(_onUpdateRequested);
    on<LibraryFileDeleted>(_onFileDeleted);
    on<LibraryFileAdded>(_onFileAdded);
    on<LibraryFileDeleteRequested>(_onFileDeleteRequested);
    on<LibraryFilePlayRequested>(_onFilePlayRequested);
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
    final path = event.path ??

        /// Cannot mock `getDirecotryPath` method...
        (Platform.environment.containsKey('FLUTTER_TEST')
            ? null
            : await FilePicker.platform.getDirectoryPath());

    if (path == null) return;

    emit(LibraryLoading(path: path));

    try {
      final entries = await repository.retrieveFilesAsLibraryEntries(path);

      if (entries.isEmpty) {
        emit(LibraryEmpty(path: path));
      } else {
        emit(
          LibraryLoaded(
            entries: entries,
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
    if (state.runtimeType != LibraryLoaded) return;

    final file = event.file;

    /// Find `file` in existing entries if any
    final currentState = state as LibraryLoaded;

    final newEntries =
        repository.removeFileFromEntries(currentState.entries, file);

    if (newEntries == null) return;

    if (newEntries.isEmpty) {
      emit(LibraryEmpty(path: state.path));
    } else {
      emit(
        LibraryLoaded(
          id: currentState.id + 1,
          entries: newEntries,
          path: state.path,
        ),
      );
    }
  }

  Future<void> _onFileAdded(
      LibraryFileAdded event, Emitter<LibraryState> emit) async {
    if (state.runtimeType != LibraryLoaded) return;

    final file = await LocalFile.createAndSearchMedia(event.path);

    /// Find `file` in existing entries if any
    final currentState = state as LibraryLoaded;
    final entries = repository.addFileToEntries(
      currentState.entries,
      file,
    );

    emit(
      LibraryLoaded(
        id: currentState.id + 1,
        entries: entries,
        path: state.path,
      ),
    );
  }

  Future<void> _onFileDeleteRequested(
      LibraryFileDeleteRequested event, Emitter<LibraryState> emit) async {
    await repository.deleteFile(event.file);
  }

  Future<void> _onFilePlayRequested(
      LibraryFilePlayRequested event, Emitter<LibraryState> emit) async {
    await playFile(event.file, event.context);
  }
}
