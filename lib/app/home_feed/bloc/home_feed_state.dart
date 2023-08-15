part of 'home_feed_bloc.dart';

sealed class HomeFeedState extends Equatable {
  const HomeFeedState({
    this.entries = const [],
    this.range,
  });

  final List<Media> entries;
  final DateTimeRange? range;

  @override
  List<Object?> get props => [
        entries,
        range,
      ];
}

final class HomeFeedInitial extends HomeFeedState {}

final class HomeFeedLoading extends HomeFeedState {
  const HomeFeedLoading({super.entries, super.range});

  @override
  List<Object?> get props => [
        entries,
        range,
      ];
}

final class HomeFeedLoaded extends HomeFeedState {
  const HomeFeedLoaded({super.entries, super.range});

  @override
  List<Object?> get props => [
        entries,
        range,
      ];
}

final class HomeFeedFailed extends HomeFeedState {
  const HomeFeedFailed({
    super.entries,
    super.range,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        entries,
        range,
        message,
      ];
}
