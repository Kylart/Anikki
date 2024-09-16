part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeCurrentMediaChanged extends HomeEvent {
  const HomeCurrentMediaChanged(this.entry);

  final MediaListEntry? entry;

  @override
  List<Object?> get props => [
        entry,
      ];
}

final class HomeDrawerMediaChanged extends HomeEvent {
  const HomeDrawerMediaChanged(this.media);

  final Media? media;

  @override
  List<Object?> get props => [
        media,
      ];
}

final class HomeCurrentBackgroundUrlChanged extends HomeEvent {
  const HomeCurrentBackgroundUrlChanged(this.url);

  final String? url;

  @override
  List<Object?> get props => [
        url,
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
