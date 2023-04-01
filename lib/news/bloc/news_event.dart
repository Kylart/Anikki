part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsRequested extends NewsEvent {
  NewsRequested({required this.range});

  final DateTimeRange range;
}
