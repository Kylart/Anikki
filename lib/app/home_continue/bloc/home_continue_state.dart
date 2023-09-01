part of 'home_continue_bloc.dart';

sealed class HomeContinueState extends Equatable {
  const HomeContinueState({
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

final class HomeContinueInitial extends HomeContinueState {}

final class HomeContinueLoading extends HomeContinueState {
  const HomeContinueLoading({super.entries, super.username});
}

final class HomeContinueLoaded extends HomeContinueState {
  const HomeContinueLoaded({super.entries, super.username});
}

final class HomeContinueError extends HomeContinueState {
  const HomeContinueError({
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
