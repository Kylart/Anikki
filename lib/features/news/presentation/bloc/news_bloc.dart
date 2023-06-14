import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/news/domain/domain.dart';
import 'package:anikki/core/core.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  Timer? interval;

  static final initalDateRange = computeRange();

  late final NewsRepository repository;

  NewsBloc({
    required Anilist anilist,
  }) : super(
          NewsEmpty(range: initalDateRange),
        ) {
    repository = NewsRepository(anilist);

    on<NewsEvent>((event, emit) {
      logger.v('News event: ${event.runtimeType}');
    });

    on<NewsRequested>(_onRequested);

    on<NewsOptionsChanged>(_onOptionChanged);

    _setUpInterval();
  }

  Future<void> _onRequested(
      NewsRequested event, Emitter<NewsState> emit) async {
    final range = event.range;

    emit(NewsLoading(range: range));

    try {
      final entries = await repository.getSchedule(range);

      emit(
        NewsComplete(
          range: range,
          entries: entries,
          options: state.options,
        ),
      );
    } on AnilistGetScheduleException catch (e) {
      emit(
        NewsError(
          range: range,
          message: e.error ?? 'Something went wrong...',
        ),
      );
    } finally {
      _setUpInterval();
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
      ),
    );
  }

  void _setUpInterval() {
    interval = Timer.periodic(
      const Duration(hours: 6),
      (timer) {
        if (isClosed) {
          interval?.cancel();
          interval = null;
          return;
        }

        if (!state.options.autoRefresh) return;

        add(
          NewsRequested(
            range: computeRange(),
          ),
        );
      },
    );
  }
}
