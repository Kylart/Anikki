import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AnimeInformationRepository repository;

  SearchBloc(this.repository) : super(const SearchEmptyTerm()) {
    on<SearchEvent>((event, emit) {
      logger.v('Search Event: ${event.runtimeType}');
    });

    on<SearchRequested>(_onSearchRequested);
  }

  Future<void> _onSearchRequested(
      SearchRequested event, Emitter<SearchState> emit) async {
    final term = event.term;

    if (term.isEmpty) {
      emit(const SearchEmptyTerm());
      return;
    }

    emit(SearchLoading(term));

    try {
      final result = await repository.search(
        term,
        libraryEntries: event.libraryEntries,
      );

      emit(
        SearchSuccess(
          term,
          result,
        ),
      );
    } catch (e) {
      emit(SearchError(term, e.toString()));
    }
  }
}
