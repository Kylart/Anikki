part of 'home_timelines_bloc.dart';

sealed class HomeTimelinesState extends Equatable {
  const HomeTimelinesState({
    required this.type,
    this.entries = const [],
  });

  final TimelineType type;
  final List<TimelineEntry> entries;

  Iterable<TimelineEntry> get currentTypeEntries =>
      entries.where((entry) => entry.type == type);

  set type(TimelineType value) => type = value;

  @override
  List<Object> get props => [
        type,
        entries,
      ];
}

final class HomeTimelinesInitial extends HomeTimelinesState {
  const HomeTimelinesInitial({
    required super.type,
  });
}

final class HomeTimelinesLoading extends HomeTimelinesState {
  const HomeTimelinesLoading({
    required super.type,
    super.entries,
  });
}

final class HomeTimelinesLoaded extends HomeTimelinesState {
  const HomeTimelinesLoaded({
    required super.type,
    super.entries,
  });
}

final class HomeTimelinesError extends HomeTimelinesState {
  const HomeTimelinesError({
    required super.type,
    super.entries,
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [
        type,
        entries,
        message,
      ];
}
