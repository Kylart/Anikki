part of 'watch_list_bloc.dart';

abstract class WatchListEvent extends Equatable {
  const WatchListEvent();

  @override
  List<Object> get props => [];
}

class WatchListRequested extends WatchListEvent {
  const WatchListRequested({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class WatchListReset extends WatchListEvent {}

class WatchListWatched extends WatchListEvent {
  const WatchListWatched({
    required this.entry,
    required this.scaffold,
  });

  final LocalFile entry;
  final ScaffoldMessengerState scaffold;

  @override
  List<Object> get props => [
        entry,
        scaffold,
      ];
}
