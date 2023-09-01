import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:collection/collection.dart';

typedef UserWatchList = Map<Enum$MediaListStatus,
    List<Query$GetLists$MediaListCollection$lists$entries>>;

/// Repository that handles user anime list on providers (for now only Anilist)
class UserListRepository {
  const UserListRepository(this.anilist);

  /// The [Anilist] object to use to interact with Anilist.
  final Anilist anilist;

  /// Mark a [Media] as watched for the given episode.
  /// If `episode == 1`, will set the status of the entry to `Current`.
  Future<void> watchedEntry({
    required int episode,
    required Media media,
  }) async {
    if (media.anilistInfo.id == 0) return;

    await anilist.updateEntry(
      episode: episode,
      mediaId: media.anilistInfo.id,
      status: episode == 1 && media.anilistInfo.episodes != 1
          ? Enum$MediaListStatus.CURRENT
          : null,
    );
  }

  /// Returns the watch lists of the user at `username`
  Future<UserWatchList> getList(String username) async {
    return await anilist.getWatchLists(
      username,
      useCache: false,
    );
  }

  Future<List<AnilistListEntry>> getContinueList(String username) async {
    final list = await getList(username);
    final currentList = list[Enum$MediaListStatus.CURRENT] ?? [];

    return currentList.where((element) {
      final progress = element.progress ?? 0;
      final nextEpisode = element.media?.nextAiringEpisode?.episode;
      final nbEpisodes = element.media?.episodes ?? -1;

      if (nextEpisode != null) {
        return progress < nextEpisode - 1;
      } else {
        return progress < nbEpisodes;
      }
    }).toList();
  }

  Future<List<AnilistListEntry>> getStartList(String username) async {
    final season = currentSeason();
    final year = DateTime.now().year;
    final watchList = await getList(username);
    final planningList = watchList[Enum$MediaListStatus.PLANNING] ?? [];

    final entries = planningList.where((element) {
      return element.media?.season == season &&
          element.media?.seasonYear == year &&
          element.media?.nextAiringEpisode?.episode != 1 &&
          element.progress == 0;
    }).toList();

    return entries;
  }

  /// Returns whether the entry is planned to watch or in currently watching status
  static bool isFollowed(WatchListComplete watchList, Media entry) {
    return [...watchList.planning, ...watchList.current]
        .where((element) => element.media?.id == entry.anilistInfo.id)
        .isNotEmpty;
  }

  /// Returns whether the entry is completed or watched
  static bool isSeen(WatchListComplete watchList, Media entry) {
    final currentEntry = watchList.current.firstWhereOrNull(
        (element) => element.media?.id == entry.anilistInfo.id);

    final seen = currentEntry?.progress == null
        ? false
        : currentEntry?.media?.nextAiringEpisode?.episode ==
            currentEntry!.progress! + 1;

    final completed = watchList.completed
        .where((e) => e.media?.id == entry.anilistInfo.id)
        .isNotEmpty;

    return seen || completed;
  }
}
