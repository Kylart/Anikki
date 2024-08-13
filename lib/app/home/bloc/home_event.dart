part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeCurrentMediaChanged extends HomeEvent {
  const HomeCurrentMediaChanged(this.media);

  final Media? media;

  @override
  List<Object?> get props => [
        media,
      ];
}

final class HomeRefreshed extends HomeEvent {
  const HomeRefreshed(this.watchList);

  final AnilistWatchList? watchList;

  @override
  List<Object?> get props => [
        watchList,
      ];
}
