part of 'home_feed_bloc.dart';

sealed class HomeFeedEvent extends Equatable {
  const HomeFeedEvent();

  @override
  List<Object> get props => [];
}

final class HomeFeedRefresh extends HomeFeedEvent {}

class HomeFeedOptionsChanged extends HomeFeedEvent {
  const HomeFeedOptionsChanged({required this.options});

  final HomeFeedOptions options;

  @override
  List<Object> get props => [
        options,
      ];
}
