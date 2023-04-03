part of 'library_bloc.dart';

abstract class LibraryState extends Equatable {
  const LibraryState({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}

class LibraryInitial extends LibraryState {
  const LibraryInitial({super.path = ''});
}

class LibraryLoading extends LibraryState {
  const LibraryLoading({required super.path});

  @override
  List<Object> get props => [path];
}

class LibraryLoaded extends LibraryState {
  final List<LocalFile> entries;

  const LibraryLoaded({required this.entries, required super.path});

  @override
  List<Object> get props => [entries, path];

  @override
  String toString() {
    return [
      path,
      'Entries: ${entries.length}',
    ].join(', ');
  }
}

class LibraryEmpty extends LibraryState {
  const LibraryEmpty({required super.path});
}

class LibraryError extends LibraryState {
  const LibraryError({required this.message, required super.path});

  final String message;

  @override
  List<Object> get props => [message, path];
}
