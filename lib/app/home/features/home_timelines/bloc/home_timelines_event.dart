part of 'home_timelines_bloc.dart';

sealed class HomeTimelinesEvent extends Equatable {
  const HomeTimelinesEvent();

  @override
  List<Object?> get props => [];
}

final class HomeTimelinesRefresh extends HomeTimelinesEvent {
  const HomeTimelinesRefresh({
    required this.userId,
    this.watchList,
    this.dateTimeRange,
  });

  final int userId;
  final DateTimeRange? dateTimeRange;
  final AnilistWatchList? watchList;

  @override
  List<Object?> get props => [
        watchList,
        dateTimeRange,
      ];
}

final class HomeTimelinesTypeChange extends HomeTimelinesEvent {
  const HomeTimelinesTypeChange(this.type);

  final TimelineType type;

  @override
  List<Object> get props => [
        type,
      ];
}
