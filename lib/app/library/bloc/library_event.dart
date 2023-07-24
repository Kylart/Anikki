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

class LibraryFileDeleteRequested extends LibraryEvent {
  const LibraryFileDeleteRequested(this.file);

  final LocalFile file;

  @override
  List<Object> get props => [
        file,
      ];
}

class LibraryFilePlayRequested extends LibraryEvent {
  const LibraryFilePlayRequested({
    required this.file,
    required this.context,
  });

  final LocalFile file;
  final BuildContext context;

  @override
  List<Object> get props => [
        file,
        context,
      ];
}
