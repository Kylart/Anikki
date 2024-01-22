part of 'watch_list_bloc.dart';

abstract class WatchListState extends Equatable {
  const WatchListState({
    required this.username,
    required this.watchList,
    this.connected = false,
  });

  final String? username;
  final bool connected;
  final AnilistWatchList watchList;

  List<AnilistWatchListEntry> get current => watchList.current;
  List<AnilistWatchListEntry> get completed => watchList.completed;
  List<AnilistWatchListEntry> get dropped => watchList.dropped;
  List<AnilistWatchListEntry> get paused => watchList.paused;
  List<AnilistWatchListEntry> get planning => watchList.planning;
  List<AnilistWatchListEntry> get repeating => watchList.repeating;

  @override
  List<Object?> get props => [
        username,
        connected,
        watchList,
      ];

  @override
  String toString() {
    return [
      username,
      connected,
      'Current List: ${current.length} entries',
      'Completed List: ${completed.length} entries',
      'Dropped List: ${dropped.length} entries',
      'Paused List: ${paused.length} entries',
      'Planning List: ${planning.length} entries',
      'Repeating List: ${repeating.length} entries',
    ].join(', ');
  }
}

class WatchListInitial extends WatchListState {
  const WatchListInitial({
    required super.username,
    super.watchList = const AnilistWatchList(),
    super.connected,
  });
}

class WatchListLoading extends WatchListState {
  const WatchListLoading({
    required super.username,
    super.watchList = const AnilistWatchList(),
    super.connected,
  });
}

class WatchListComplete extends WatchListState {
  const WatchListComplete({
    required super.username,
    required super.watchList,
    super.connected,
  });
}

class WatchListNotify extends WatchListState {
  const WatchListNotify({
    required super.username,
    required this.title,
    super.watchList = const AnilistWatchList(),
    super.connected,
    this.description,
    this.isError = false,
  });

  final String title;
  final String? description;
  final bool isError;

  @override
  List<Object?> get props => [
        username,
        title,
        description,
        isError,
        connected,
        watchList,
      ];
}

class WatchListError extends WatchListState {
  const WatchListError({
    required super.username,
    required this.message,
    super.watchList = const AnilistWatchList(),
    super.connected,
  });

  final String message;

  @override
  List<Object?> get props => [
        username,
        message,
        connected,
        watchList,
      ];
}
