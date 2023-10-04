part of 'watch_list_bloc.dart';

abstract class WatchListEvent extends Equatable {
  const WatchListEvent();

  @override
  List<Object?> get props => [];
}

class WatchListRequested extends WatchListEvent {
  const WatchListRequested({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class WatchListReset extends WatchListEvent {}

class WatchListAuthUpdated extends WatchListEvent {
  WatchListAuthUpdated({
    required this.connected,
    this.username,
  }) {
    if (connected) {
      assert(username != null, 'Cannot be connected without a username.');
    }
  }

  final bool connected;
  final String? username;

  @override
  List<Object> get props => [
        connected,
        if (username != null) username!,
      ];
}

class WatchListWatched extends WatchListEvent {
  WatchListWatched({
    this.entry,
    this.media,
    this.episode,
    this.scaffold,
  }) {
    if (entry == null) {
      assert(media != null && episode != null);
    }
  }

  final LocalFile? entry;
  final Media? media;
  final int? episode;
  final ScaffoldMessengerState? scaffold;

  @override
  List<Object?> get props => [
        entry,
        scaffold,
        media,
        episode,
      ];
}
