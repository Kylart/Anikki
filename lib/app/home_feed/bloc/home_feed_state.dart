part of 'home_feed_bloc.dart';

sealed class HomeFeedState extends Equatable {
  const HomeFeedState({
    this.entries = const [],
    this.range,
    this.options = const HomeFeedOptions(),
  });

  final List<Query$AiringSchedule$Page$airingSchedules> entries;
  final DateTimeRange? range;
  final HomeFeedOptions options;

  @override
  List<Object?> get props => [
        entries,
        range,
        options,
      ];
}

final class HomeFeedInitial extends HomeFeedState {}

final class HomeFeedLoading extends HomeFeedState {
  const HomeFeedLoading({
    super.entries,
    super.range,
    super.options,
  });

  @override
  List<Object?> get props => [
        entries,
        range,
        options,
      ];
}

final class HomeFeedLoaded extends HomeFeedState {
  const HomeFeedLoaded({
    super.entries,
    super.range,
    super.options,
  });

  @override
  List<Object?> get props => [
        entries,
        range,
        options,
      ];
}

final class HomeFeedFailed extends HomeFeedState {
  const HomeFeedFailed({
    super.entries,
    super.range,
    super.options,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        entries,
        range,
        message,
        options,
      ];
}
