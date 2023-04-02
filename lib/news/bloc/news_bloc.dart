import 'dart:async';

import 'package:anilist/anilist.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/helpers/logger.dart';
import 'package:anikki/helpers/anilist_client.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  static final initalDateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now()
        .add(const Duration(days: 1))
        .copyWith(hour: 23, minute: 59, second: 59),
  );

  final repository = Anilist(client: getAnilistClient());

  NewsBloc()
      : super(
          NewsInitial(range: initalDateRange),
        ) {
    on<NewsEvent>((event, emit) {
      logger.v('News event: ${event.runtimeType}');
    });

    on<NewsRequested>(_onRequested);
  }

  Future<void> _onRequested(
      NewsRequested event, Emitter<NewsState> emit) async {
    final range = event.range;

    emit(NewsLoading(range: range));

    try {
      final entries = await repository.getSchedule(range);

      emit(NewsComplete(range: range, entries: entries));
    } on AnilistGetScheduleException catch (e) {
      emit(NewsError(
          range: range, message: e.error ?? 'Something went wrong...'));
    } catch (e) {
      emit(NewsError(range: range, message: e.toString()));
    }
  }
}
