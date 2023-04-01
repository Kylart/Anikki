part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState({required this.range});

  final DateTimeRange range;

  @override
  List<Object> get props => [range];
}

class NewsInitial extends NewsState {
  const NewsInitial({required super.range});
}

class NewsLoading extends NewsState {
  const NewsLoading({required super.range});
}

class NewsComplete extends NewsState {
  const NewsComplete({required super.range, required this.entries});

  final List<Query$AiringSchedule$Page$airingSchedules> entries;

  @override
  List<Object> get props => [range, '${entries.length} entries'];
}

class NewsError extends NewsState {
  const NewsError({required super.range, required this.message});

  final String message;

  @override
  List<Object> get props => [range, message];
}
