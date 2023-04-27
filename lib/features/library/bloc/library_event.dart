part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

class LibraryUpdateRequested extends LibraryEvent {
  const LibraryUpdateRequested({this.path});

  final String? path;

  @override
  List<Object> get props => [path ?? ''];
}

class LibraryFileDeleted extends LibraryEvent {
  const LibraryFileDeleted({required this.file});

  final LocalFile file;
  @override
  List<Object> get props => [file];
}

class LibraryFileAdded extends LibraryEvent {
  const LibraryFileAdded({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}

class LibraryEntryExpanded extends LibraryEvent {
  const LibraryEntryExpanded({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
