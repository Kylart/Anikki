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
  final List<LibraryEntry> entries;
  final List<bool> expandedEntries;

  get playlist => entries.fold<List<String>>(
        [],
        (previousValue, element) => [
          ...previousValue,

          /// Taking `reversed` becasue the entries of a `LibraryEntry` are sorted descendingly
          /// and we want the next eposide to be the (N + 1)th.
          ...element.entries.reversed.map((e) => e.path),
        ],
      );

  const LibraryLoaded({
    required super.path,
    required this.entries,
    required this.expandedEntries,
  });

  @override
  List<Object> get props => [entries, path, expandedEntries];

  @override
  String toString() {
    return [
      'LibraryLoaded(',
      path,
      'Entries: ${entries.length}',
      expandedEntries,
      ')',
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
