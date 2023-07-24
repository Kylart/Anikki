import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';

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

  /// Returns whether the entry is planned to watch or in currently watching status
  static bool isFollowed(WatchListComplete watchList, NewsEntry entry) {
    return [...watchList.planning, ...watchList.current]
        .where((element) => element.media?.id == entry.media.anilistInfo.id)
        .isNotEmpty;
  }

  /// Returns whether the entry is completed or watched
  static bool isSeen(WatchListComplete watchList, NewsEntry entry) {
    if (entry.episode == null) return false;

    final listEntry = watchList.current
        .where((element) => element.media?.id == entry.media.anilistInfo.id);

    final isCompleted = watchList.completed
        .where((e) => e.media?.id == entry.media.anilistInfo.id)
        .isNotEmpty;

    return (listEntry.isNotEmpty &&
            (listEntry.first.progress ?? -1) >= entry.episode!) ||
        isCompleted;
  }
}
