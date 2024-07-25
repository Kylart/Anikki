part of 'home_start_bloc.dart';

sealed class HomeStartEvent extends Equatable {
  const HomeStartEvent();

  @override
  List<Object?> get props => [];
}

final class HomeStartRefresh extends HomeStartEvent {
  const HomeStartRefresh(this.watchList);

  final AnilistWatchList watchList;

  @override
  List<Object?> get props => [
        watchList,
      ];
}
