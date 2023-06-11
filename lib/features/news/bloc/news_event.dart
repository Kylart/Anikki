part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {}

class NewsRequested extends NewsEvent {
  NewsRequested({required this.range});

  final DateTimeRange range;

  @override
  List<Object> get props => [range];
}

class NewsOptionsChanged extends NewsEvent {
  NewsOptionsChanged({required this.options});

  final NewsOptions options;

  @override
  List<Object> get props => [options];
}
