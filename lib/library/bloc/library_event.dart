part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

class LibraryUpdateRequested extends LibraryEvent {
  const LibraryUpdateRequested({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}

class LibraryFileDeleted extends LibraryEvent {
  const LibraryFileDeleted({ required this.file });

  final LocalFile file;
}