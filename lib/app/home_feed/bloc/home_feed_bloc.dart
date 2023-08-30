import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_feed_event.dart';
part 'home_feed_state.dart';

class HomeFeedBloc extends Bloc<HomeFeedEvent, HomeFeedState> {
  final FeedRepository repository;

  HomeFeedBloc(this.repository) : super(HomeFeedInitial()) {
    on<HomeFeedEvent>((event, emit) {
      logger.t('HomeFeedEvent: ${event.runtimeType}');
    });

    on<HomeFeedRefresh>(_onRefresh);
    on<HomeFeedOptionsChanged>(_onOptionChanged);
  }

  Future<void> _onRefresh(
      HomeFeedRefresh event, Emitter<HomeFeedState> emit) async {
    final range = FeedRepository.computeRange();

    try {
      emit(HomeFeedLoading(
        range: range,
        entries: state.entries,
        options: state.options,
      ));

      final entries = await repository.getSchedule(range);

      emit(
        HomeFeedLoaded(
          entries: entries,
          range: range,
          options: state.options,
        ),
      );
    } on AnilistGetScheduleException catch (e) {
      emit(
        HomeFeedFailed(
          message: e.cause,
          entries: state.entries,
          range: range,
          options: state.options,
        ),
      );
    } catch (e) {
      emit(
        HomeFeedFailed(
          message: e.toString(),
          entries: state.entries,
          range: range,
          options: state.options,
        ),
      );
    }
  }

  void _onOptionChanged(
      HomeFeedOptionsChanged event, Emitter<HomeFeedState> emit) {
    if (state is! HomeFeedLoaded) return;

    emit(
      HomeFeedLoaded(
        range: state.range,
        entries: state.entries,
        options: event.options,
      ),
    );
  }
}
