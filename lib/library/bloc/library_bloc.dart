import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/library/repository/repository.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/helpers/logger.dart';
import 'package:anikki/models/local_file.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final StateStreamableSource<SettingsState> settingsBloc;

  LibraryBloc({required this.settingsBloc}) : super(const LibraryInitial()) {
    on<LibraryEvent>((event, emit) {
      logger.v('Library event: ${event.runtimeType}');
    });

    on<LibraryUpdateRequested>(_onUpdateRequested);
    on<LibraryFileDeleted>(_onFileDeleted);

    settingsBloc.stream.listen((settingsState) {
      final newPath = settingsState.settings.localDirectory;
      final currentPath = state.path;

      if (newPath != currentPath) {
        add(LibraryUpdateRequested(path: newPath));
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
}
