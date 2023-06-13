import 'package:anikki/core/core.dart';
import 'package:anikki/features/library/domain/models/models.dart';
import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  const SearchResult({
    required this.term,
    this.libraryEntries,
    this.torrents,
    this.staffs,
    this.characters,
    this.medias,
  });

  /// Term for this result
  final String term;

  /// `entries` from a [LibraryLoaded] state
  final List<LibraryEntry>? libraryEntries;

  /// [Nyaa] results
  final List<Torrent>? torrents;

  /// Anilist related results
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
      'SearchResult(term:',
      term,
      'libraryEntries:',
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
}
