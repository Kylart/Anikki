part of 'home_continue_bloc.dart';

sealed class HomeContinueState extends Equatable {
  const HomeContinueState({
    this.entries = const [],
  });

  final List<AnilistListEntry> entries;

  @override
  List<Object> get props => [
        entries,
      ];
}

final class HomeContinueInitial extends HomeContinueState {}

final class HomeContinueLoading extends HomeContinueState {
  const HomeContinueLoading({super.entries});
}

final class HomeContinueLoaded extends HomeContinueState {
  const HomeContinueLoaded({super.entries});
}

final class HomeContinueError extends HomeContinueState {
  const HomeContinueError({
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
