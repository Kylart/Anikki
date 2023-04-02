part of 'watch_list_bloc.dart';

abstract class WatchListState extends Equatable {
  const WatchListState({required this.username});

  final String? username;

  @override
  List<Object?> get props => [username];
}

class WatchListInitial extends WatchListState {
  const WatchListInitial({required super.username});
}

class WatchListLoading extends WatchListState {
  const WatchListLoading({required super.username});
}

class WatchListComplete extends WatchListState {
  const WatchListComplete({required super.username, required this.watchList});

  final Map<Enum$MediaListStatus,
      List<Query$GetLists$MediaListCollection$lists$entries>> watchList;

  List<Query$GetLists$MediaListCollection$lists$entries> get current =>
      watchList[Enum$MediaListStatus.CURRENT] ?? [];
  List<Query$GetLists$MediaListCollection$lists$entries> get completed =>
      watchList[Enum$MediaListStatus.COMPLETED] ?? [];
  List<Query$GetLists$MediaListCollection$lists$entries> get dropped =>
      watchList[Enum$MediaListStatus.DROPPED] ?? [];
  List<Query$GetLists$MediaListCollection$lists$entries> get paused =>
      watchList[Enum$MediaListStatus.PAUSED] ?? [];
  List<Query$GetLists$MediaListCollection$lists$entries> get planning =>
      watchList[Enum$MediaListStatus.PLANNING] ?? [];
  List<Query$GetLists$MediaListCollection$lists$entries> get repeating =>
      watchList[Enum$MediaListStatus.REPEATING] ?? [];

  @override
  List<Object?> get props => [
        username,
        'Current List: ${current.length} entries',
        'Completed List: ${completed.length} entries',
        'Dropped List: ${dropped.length} entries',
        'Paused List: ${paused.length} entries',
        'Planning List: ${planning.length} entries',
        'Repeating List: ${repeating.length} entries',
      ];
}

class WatchListError extends WatchListState {
  const WatchListError({required super.username, required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
