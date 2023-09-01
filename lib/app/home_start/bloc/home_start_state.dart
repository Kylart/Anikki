part of 'home_start_bloc.dart';

sealed class HomeStartState extends Equatable {
  const HomeStartState({
    this.entries = const [],
    this.username = '',
  });

  final List<AnilistListEntry> entries;
  final String username;

  @override
  List<Object> get props => [
        entries,
        username,
      ];
}

final class HomeStartInitial extends HomeStartState {}

final class HomeStartLoading extends HomeStartState {
  const HomeStartLoading({super.entries, super.username});
}

final class HomeStartLoaded extends HomeStartState {
  const HomeStartLoaded({super.entries, super.username});
}

final class HomeStartEmpty extends HomeStartState {
  const HomeStartEmpty({super.username});
}

final class HomeStartError extends HomeStartState {
  const HomeStartError({
    super.entries,
    super.username,
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [
        entries,
        message,
        username,
      ];
}
