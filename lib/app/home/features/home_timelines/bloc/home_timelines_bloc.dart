import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/home/features/home_timelines/models/models.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'home_timelines_event.dart';
part 'home_timelines_state.dart';

class HomeTimelinesBloc extends Bloc<HomeTimelinesEvent, HomeTimelinesState> {
  final FeedRepository feedRepository;

  HomeTimelinesBloc(this.feedRepository)
      : super(const HomeTimelinesInitial(type: TimelineType.feed)) {
    on<HomeTimelinesRefresh>(_onRefresh);
    on<HomeTimelinesTypeChange>(_onTimelineTypeChange);
  }

  Future<void> _onRefresh(
    HomeTimelinesRefresh event,
    Emitter<HomeTimelinesState> emit,
  ) async {
    emit(
      HomeTimelinesLoading(
        type: state.type,
        entries: state.entries,
      ),
    );

    try {
      final schedule = await feedRepository.getSchedule(
        FeedRepository.computeRange(),
        ids: event.watchList == null
            ? null
            : <AnilistListEntry>[
                ...(event.watchList?.current ?? []),
                ...(event.watchList?.planning) ?? [],
              ]
                .where((entry) => entry.media != null)
                .map((entry) => entry.media!.id)
                .toList(),
      );

      emit(
        HomeTimelinesLoaded(
          type: state.type,
          entries: <TimelineEntry>{
            ...schedule,
          }.toList(),
        ),
      );
    } on AnilistGetScheduleException catch (e) {
      emit(
        HomeTimelinesError(type: state.type, message: e.cause),
      );
    } catch (e) {
      emit(
        HomeTimelinesError(type: state.type, message: e.toString()),
      );
    }
  }

  void _onTimelineTypeChange(
    HomeTimelinesTypeChange event,
    Emitter<HomeTimelinesState> emit,
  ) {
    emit(
      switch (state) {
        HomeTimelinesInitial() => HomeTimelinesInitial(type: event.type),
        HomeTimelinesLoading() =>
          HomeTimelinesLoading(type: event.type, entries: state.entries),
        HomeTimelinesLoaded() =>
          HomeTimelinesLoaded(type: event.type, entries: state.entries),
        HomeTimelinesError() => HomeTimelinesError(
            type: event.type,
            entries: state.entries,
            message: (state as HomeTimelinesError).message,
          ),
      },
    );
  }
}
