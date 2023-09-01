import 'package:anikki/data/data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

part 'home_start_event.dart';
part 'home_start_state.dart';

Enum$MediaSeason currentSeason() {
  final month = DateTime.now().month;

  if (month <= 3) {
    return Enum$MediaSeason.WINTER;
  } else if (month <= 6) {
    return Enum$MediaSeason.SPRING;
  } else if (month <= 9) {
    return Enum$MediaSeason.SUMMER;
  }

  return Enum$MediaSeason.FALL;
}

class HomeStartBloc extends AutoRefreshBloc<HomeStartEvent, HomeStartState> {
  final UserListRepository repository;

  HomeStartBloc(this.repository) : super(HomeStartInitial()) {
    on<HomeStartEvent>((event, emit) {
      logger.t('HomeStartEvent: ${event.runtimeType}');
    });

    on<HomeStartRefresh>(_onRefresh);

    setUpAutoRefresh();
  }

  @override
  void autoRefresh() async {
    add(HomeStartRefresh(state.username));
  }

  Future<void> _onRefresh(
      HomeStartRefresh event, Emitter<HomeStartState> emit) async {
    try {
      emit(
        HomeStartLoading(
          entries: state.entries,
          username: event.username,
        ),
      );

      final season = currentSeason();
      final year = DateTime.now().year;
      final watchList = await repository.getList(event.username);
      final entries =
          watchList[Enum$MediaListStatus.PLANNING]?.where((element) {
                return element.media?.season == season &&
                    element.media?.seasonYear == year &&
                    element.media?.nextAiringEpisode?.episode != 1 &&
                    element.progress == 0;
              }).toList() ??
              [];

      if (entries.isEmpty) {
        emit(HomeStartEmpty(username: event.username));
      } else {
        emit(
          HomeStartLoaded(
            entries: entries,
            username: event.username,
          ),
        );
      }
    } on AnilistGetListException catch (e) {
      emit(
        HomeStartError(
          entries: state.entries,
          username: event.username,
          message: e.error ?? e.cause,
        ),
      );
    } catch (e) {
      emit(
        HomeStartError(
          entries: state.entries,
          username: event.username,
          message: e.toString(),
        ),
      );
    }
  }
}
