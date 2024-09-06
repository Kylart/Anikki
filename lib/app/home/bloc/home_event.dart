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

final class HomeCurrentBackgroundUrlChanged extends HomeEvent {
  const HomeCurrentBackgroundUrlChanged(this.url);

  final String? url;

  @override
  List<Object?> get props => [
        url,
      ];
}

final class HomeRefreshed extends HomeEvent {
  const HomeRefreshed({
    required this.watchList,
    required this.connected,
  });

  final AnilistWatchList watchList;
  final bool connected;

  @override
  List<Object?> get props => [
        watchList,
        connected,
      ];
}
