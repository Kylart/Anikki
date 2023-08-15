part of 'home_more_bloc.dart';

sealed class HomeMoreEvent extends Equatable {
  const HomeMoreEvent();

  @override
  List<Object> get props => [];
}

final class HomeMoreRefresh extends HomeMoreEvent {}
