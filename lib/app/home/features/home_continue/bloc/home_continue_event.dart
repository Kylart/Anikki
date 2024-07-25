part of 'home_continue_bloc.dart';

sealed class HomeContinueEvent extends Equatable {
  const HomeContinueEvent();

  @override
  List<Object?> get props => [];
}

final class HomeContinueRefresh extends HomeContinueEvent {
  const HomeContinueRefresh(this.watchList);

  final AnilistWatchList watchList;

  @override
  List<Object?> get props => [
        watchList,
      ];
}
