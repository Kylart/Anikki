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
      logger.v('HomeFeedEvent: ${event.runtimeType}');
    });

    on<HomeFeedRefresh>(_onRefresh);
  }

  Future<void> _onRefresh(
      HomeFeedRefresh event, Emitter<HomeFeedState> emit) async {
    final range = FeedRepository.computeRange();

    try {
      emit(HomeFeedLoading(
        range: range,
      ));

      final entries = await repository.getSchedule(range);

      emit(
        HomeFeedLoaded(
          entries: entries,
          range: range,
        ),
      );
    } on AnilistGetScheduleException catch (e) {
      emit(
        HomeFeedFailed(
          message: e.cause,
          entries: state.entries,
          range: range,
        ),
      );
    } catch (e) {
      emit(
        HomeFeedFailed(
          message: e.toString(),
          entries: state.entries,
          range: range,
        ),
      );
    }
  }
}
