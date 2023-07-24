part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent(this.term);

  final String term;

  @override
  List<Object> get props => [];
}

class SearchRequested extends SearchEvent {
  const SearchRequested(
    super.term, {
    this.libraryEntries = const [],
  });

  final List<LibraryEntry> libraryEntries;

  @override
  List<Object> get props => [
        term,
        libraryEntries,
      ];
}
