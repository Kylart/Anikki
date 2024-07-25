part of 'home_start_bloc.dart';

sealed class HomeStartState extends Equatable {
  const HomeStartState({
    this.entries = const [],
  });

  final List<AnilistListEntry> entries;

  @override
  List<Object> get props => [
        entries,
      ];
}

final class HomeStartInitial extends HomeStartState {}

final class HomeStartLoading extends HomeStartState {
  const HomeStartLoading({super.entries});
}

final class HomeStartLoaded extends HomeStartState {
  const HomeStartLoaded({super.entries});
}

final class HomeStartEmpty extends HomeStartState {
  const HomeStartEmpty({super.entries = const []});
}

final class HomeStartError extends HomeStartState {
  const HomeStartError({
    super.entries,
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [
        entries,
        message,
      ];
}
