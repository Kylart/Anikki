part of 'models.dart';

typedef AnilistWatchListEntry
    = Query$GetLists$MediaListCollection$lists$entries;

class AnilistWatchList extends Equatable {
  const AnilistWatchList({
    this.completed = const [],
    this.current = const [],
    this.dropped = const [],
    this.paused = const [],
    this.planning = const [],
    this.repeating = const [],
  });

  final List<AnilistWatchListEntry> completed;
  final List<AnilistWatchListEntry> current;
  final List<AnilistWatchListEntry> dropped;
  final List<AnilistWatchListEntry> paused;
  final List<AnilistWatchListEntry> planning;
  final List<AnilistWatchListEntry> repeating;

  AnilistWatchList copyWith({
    List<AnilistWatchListEntry>? completed,
    List<AnilistWatchListEntry>? current,
    List<AnilistWatchListEntry>? dropped,
    List<AnilistWatchListEntry>? paused,
    List<AnilistWatchListEntry>? planning,
    List<AnilistWatchListEntry>? repeating,
  }) {
    return AnilistWatchList(
      completed: completed ?? this.completed,
      current: current ?? this.current,
      dropped: dropped ?? this.dropped,
      paused: paused ?? this.paused,
      planning: planning ?? this.planning,
      repeating: repeating ?? this.repeating,
    );
  }

  @override
  List<Object?> get props => [
        completed,
        current,
        dropped,
        paused,
        planning,
        repeating,
      ];
}
