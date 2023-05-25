part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState([this.term = '']);

  final String term;

  @override
  List<Object> get props => [
        term,
      ];
}

class SearchEmptyTerm extends SearchState {
  const SearchEmptyTerm();
}

class SearchLoading extends SearchState {
  const SearchLoading(super.term);
}

class SearchSuccess extends SearchState {
  const SearchSuccess(
    super.term, {
    this.libraryEntries,
    this.torrents,
    this.staffs,
    this.characters,
    this.medias,
  });

  final List<LibraryEntry>? libraryEntries;

  final List<Torrent>? torrents;

  final List<Query$Search$staff$results>? staffs;
  final List<Query$Search$characters$results>? characters;
  final List<Fragment$shortMedia>? medias;

  bool get isEmpty => [
        libraryEntries?.isEmpty,
        torrents?.isEmpty,
        staffs?.isEmpty,
        characters?.isEmpty,
        medias?.isEmpty,
      ].whereType<bool>().every((b) => b);

  @override
  List<Object> get props => [
        term,
        libraryEntries ?? [],
        torrents ?? [],
        staffs ?? [],
        characters ?? [],
        medias ?? [],
      ];

  @override
  String toString() {
    return [
      'SearchSuccess(libraryEntries:',
      libraryEntries?.length ?? 0,
      'torrents:',
      torrents?.length ?? 0,
      'staffs:',
      staffs?.length ?? 0,
      'characters:',
      characters?.length ?? 0,
      'medias:',
      medias?.length ?? 0,
      ')'
    ].join(', ');
  }

  SearchSuccess copyWith({
    List<LibraryEntry>? libraryEntries,
    List<Torrent>? torrents,
    List<Query$Search$staff$results>? staffs,
    List<Query$Search$characters$results>? characters,
    List<Fragment$shortMedia>? medias,
  }) {
    return SearchSuccess(
      term,
      libraryEntries: libraryEntries ?? this.libraryEntries,
      torrents: torrents ?? this.torrents,
      staffs: staffs ?? this.staffs,
      characters: characters ?? this.characters,
      medias: medias ?? this.medias,
    );
  }
}

class SearchError extends SearchState {
  const SearchError(super.term, this.message);

  final String message;

  @override
  List<Object> get props => [
        term,
        message,
      ];
}
