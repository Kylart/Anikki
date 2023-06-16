part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState({
    required this.range,
    this.options = const NewsOptions(),
  });

  final DateTimeRange range;
  final NewsOptions options;

  @override
  List<Object> get props => [range, options];
}

class NewsEmpty extends NewsState {
  const NewsEmpty({super.options, required super.range});
}

class NewsLoading extends NewsState {
  const NewsLoading({super.options, required super.range});
}

class NewsComplete extends NewsState {
  const NewsComplete({
    super.options,
    required super.range,
    required this.entries,
  });

  final List<NewsEntry> entries;

  @override
  List<Object> get props => [range, entries, options];

  @override
  String toString() {
    return [range, '${entries.length} entries', options].join(', ');
  }
}

class NewsError extends NewsState {
  const NewsError({super.options, required super.range, required this.message});

  final String message;

  @override
  List<Object> get props => [range, message, options];
}
