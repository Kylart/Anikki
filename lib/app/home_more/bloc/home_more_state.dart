part of 'home_more_bloc.dart';

sealed class HomeMoreState extends Equatable {
  const HomeMoreState({
    this.entries = const [],
  });

  final List<Media> entries;

  @override
  List<Object?> get props => [
        entries,
      ];
}

final class HomeMoreInitial extends HomeMoreState {}

final class HomeMoreLoading extends HomeMoreState {
  const HomeMoreLoading({super.entries});

  @override
  List<Object?> get props => [
        entries,
      ];
}

final class HomeMoreLoaded extends HomeMoreState {
  const HomeMoreLoaded({super.entries});

  @override
  List<Object?> get props => [
        entries,
      ];
}

final class HomeMoreFailed extends HomeMoreState {
  const HomeMoreFailed({
    super.entries,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        entries,
        message,
      ];
}
