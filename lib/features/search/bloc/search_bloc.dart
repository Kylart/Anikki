import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyaa/nyaa.dart';

import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:anikki/core/helpers/logger.dart';
import 'package:anikki/core/models/library_entry.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Nyaa nyaa;
  final Anilist anilist;
  final LibraryBloc libraryBloc;

  SearchBloc({
    required this.nyaa,
    required this.anilist,
    required this.libraryBloc,
  }) : super(const SearchEmptyTerm()) {
    on<SearchEvent>((event, emit) {
      logger.v('Search Event: ${event.runtimeType}');
    });

    on<SearchRequested>((event, emit) async {
      final term = event.term;

      if (term.isEmpty) {
        emit(const SearchEmptyTerm());
        return;
      }

      emit(SearchLoading(term));

      final libraryEntries = _getLibraryEntries(term);

      try {
        final results = await Future.wait([
          _getNyaaResult(term),
          anilist.search(term),
        ]);

        final torrents = results.first as List<Torrent>;
        final anilistResult =
            results.last as Map<AnilistSearchPart, List<Object>>;

        emit(
          SearchSuccess(
            term,
            libraryEntries: libraryEntries,
            torrents: torrents,
            staffs: anilistResult[AnilistSearchPart.staffs]
                as List<Query$Search$staff$results>,
            characters: anilistResult[AnilistSearchPart.characters]
                as List<Query$Search$characters$results>,
            medias: anilistResult[AnilistSearchPart.animes]
                as List<Fragment$shortMedia>,
          ),
        );
      } catch (e) {
        if (libraryEntries.isNotEmpty) {
          emit(
            SearchSuccess(
              term,
              libraryEntries: _getLibraryEntries(term),
            ),
          );
          return;
        }

        logger.e('Error while searching', e);

        emit(SearchError(term, e.toString()));
      }
    });
  }

  Future<List<Torrent>> _getNyaaResult(String term) async {
    try {
      return await nyaa.search(term);
    } on NyaaNoResultException {
      return const [];
    }
  }

  List<LibraryEntry> _getLibraryEntries(String term) {
    if (libraryBloc.state is! LibraryLoaded) return const [];

    term = term.toLowerCase();

    return (libraryBloc.state as LibraryLoaded)
        .entries
        .where(
          (entry) =>
              (entry.media?.title?.userPreferred ?? '')
                  .toLowerCase()
                  .contains(term) ||
              (entry.entries.first.title ?? '').toLowerCase().contains(term),
        )
        .toList();
  }
}
