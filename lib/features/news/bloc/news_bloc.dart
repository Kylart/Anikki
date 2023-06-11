import 'dart:async';

import 'package:anilist/anilist.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/news/helpers/filter_entries.dart';
import 'package:anikki/features/news/models/news_options.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/helpers/logger.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  static final initalDateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now()
        .add(const Duration(days: 1))
        .copyWith(hour: 23, minute: 59, second: 59),
  );

  final Anilist repository;
  final SettingsBloc settingsBloc;
  final WatchListBloc watchListBloc;

  bool get isWatchListLoaded => watchListBloc.state is WatchListComplete;
  WatchListComplete? get watchList =>
      isWatchListLoaded ? watchListBloc.state as WatchListComplete : null;

  NewsBloc({
    required this.repository,
    required this.settingsBloc,
    required this.watchListBloc,
  }) : super(
          NewsEmpty(range: initalDateRange),
        ) {
    on<NewsEvent>((event, emit) {
      logger.v('News event: ${event.runtimeType}');
    });

    on<NewsRequested>(_onRequested);

    on<NewsOptionsChanged>(_onOptionChanged);
  }

  Future<void> _onRequested(
      NewsRequested event, Emitter<NewsState> emit) async {
    final range = event.range;

    emit(NewsLoading(range: range));

    try {
      final entries = await repository.getSchedule(range);

      emit(NewsComplete(
        range: range,
        entries: entries,
        options: state.options,
        filteredEntries: filterEntries(
          entries,
          state.options,
          watchList,
        ),
      ));
    } on AnilistGetScheduleException catch (e) {
      emit(NewsError(
          range: range, message: e.error ?? 'Something went wrong...'));
    }
  }

  void _onOptionChanged(NewsOptionsChanged event, Emitter<NewsState> emit) {
    if (state is! NewsComplete) return;

    final currentState = state as NewsComplete;

    emit(
      NewsComplete(
        range: currentState.range,
        entries: currentState.entries,
        options: event.options,
        filteredEntries: filterEntries(
          currentState.entries,
          event.options,
          watchList,
        ),
      ),
    );
  }
}
