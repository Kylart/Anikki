part of 'library_bloc.dart';

sealed class LibraryState extends Equatable {
  const LibraryState({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}

final class LibraryInitial extends LibraryState {
  const LibraryInitial({super.path = ''});
}

final class LibraryLoading extends LibraryState {
  const LibraryLoading({required super.path});

  @override
  List<Object> get props => [path];
}

final class LibraryLoaded extends LibraryState {
  final int id;

  final List<LibraryEntry> entries;

  List<mk.Media> get playlist => entries.fold<List<mk.Media>>(
        [],
        (previousValue, element) => [
          ...previousValue,

          /// Taking `reversed` becasue the entries of a `LibraryEntry` are sorted descendingly
          /// and we want the next eposide to be the (N + 1)th.
          ...element.entries.reversed.map(convertToMkMedia),
        ],
      );

  const LibraryLoaded({
    required super.path,
    required this.entries,
    this.id = 0,
  });

  @override
  List<Object> get props => [id, entries, path, playlist];

  @override
  String toString() {
    return [
      'LibraryLoaded(',
      id,
      path,
      'Entries: ${entries.length}',
      ')',
    ].join(', ');
  }
}

final class LibraryEmpty extends LibraryState {
  const LibraryEmpty({required super.path});
}

final class LibraryError extends LibraryState {
  const LibraryError({required this.message, required super.path});

  final String message;

  @override
  List<Object> get props => [message, path];
}
