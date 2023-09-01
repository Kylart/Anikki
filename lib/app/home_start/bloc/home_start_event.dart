part of 'home_start_bloc.dart';

sealed class HomeStartEvent extends Equatable {
  const HomeStartEvent();

  @override
  List<Object> get props => [];
}

final class HomeStartRefresh extends HomeStartEvent {
  const HomeStartRefresh(this.username);

  final String username;

  @override
  List<Object> get props => [
        username,
      ];
}
