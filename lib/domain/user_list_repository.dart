import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

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
  Future<AnilistWatchList> getList(String username) async {
    return await anilist.getWatchLists(
      username,
      useCache: false,
    );
  }

  List<AnilistListEntry> getContinueList(
    AnilistWatchList watchList,
  ) {
    return watchList.current.where((element) {
      final progress = element.progress ?? 0;
      final nextEpisode = element.media?.nextAiringEpisode?.episode;
      final nbEpisodes = element.media?.episodes ?? -1;

      return nextEpisode != null
          ? progress < nextEpisode - 1
          : progress < nbEpisodes;
    }).toList();
  }

  List<AnilistListEntry> getStartList(
    AnilistWatchList watchList,
  ) {
    final season = currentSeason();
    final year = DateTime.now().year;
    final planningList = watchList.planning;

    final seasonEntries = planningList.where((element) {
      return element.media?.season == season &&
          element.media?.seasonYear == year &&
          element.media?.nextAiringEpisode?.episode != 1 &&
          element.progress == 0;
    }).toList();

    if (seasonEntries.isNotEmpty) return seasonEntries;

    return watchList.planning;
  }
}
