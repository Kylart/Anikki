import 'package:collection/collection.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/helpers/anilist/anilist_utils.dart';
import 'package:anikki/data/data.dart';

/// Repository that handles user anime list on providers (for now only Anilist)
class UserListRepository {
  const UserListRepository({
    required this.anilist,
    required this.tmdb,
  });

  /// The [Anilist] object to use to interact with Anilist.
  final Anilist anilist;

  /// The [TMDB] object to use to interact with TMDB.
  final Tmdb tmdb;

  Enum$MediaListStatus? _getWatchedEntryStatus(
    WatchListState state,
    Media media,
    int episode,
  ) {
    Enum$MediaListStatus? status;

    final isCompleted =
        AnilistUtils.getCompletedEntry(state.watchList, media) != null;
    final isPlanning = AnilistUtils.getListEntry(state.planning, media) != null;

    if (isCompleted && episode == 1) {
      status = Enum$MediaListStatus.REPEATING;
    } else if (isPlanning && episode == 1) {
      status = Enum$MediaListStatus.CURRENT;
    }

    return status;
  }

  /// Mark a [Media] as watched for the given episode.
  /// If `episode == 1`, will set the status of the entry to `Current`.
  Future<void> watchedEntry({
    required int episode,
    required Media media,
    required WatchListState state,
  }) async {
    if (media.anilistInfo.id == 0) return;

    await anilist.updateEntry(
      episode: episode,
      mediaId: media.anilistInfo.id,
      status: _getWatchedEntryStatus(state, media, episode),
    );
  }

  Future<void> removeEntry({
    required int mediaId,
  }) async {
    if (mediaId == 0) return;

    await anilist.updateEntry(
      mediaId: mediaId,
      status: Enum$MediaListStatus.DROPPED,
    );
  }

  /// Returns the watch lists of the user at `username`
  Future<AnilistWatchList> getList(String username) async {
    return await anilist.getWatchLists(
      username,
      useCache: false,
    );
  }

  Future<List<MediaListEntry>> getContinueList(
    AnilistWatchList watchList,
  ) async {
    final anilistEntries = {
      ...watchList.current,
      ...watchList.repeating,
    }.where(
      (element) {
        final progress = element.progress ?? 0;
        final nextEpisode = element.media?.nextAiringEpisode?.episode;
        final nbEpisodes = element.media?.episodes ?? -1;

        return nextEpisode != null
            ? progress < nextEpisode - 1
            : progress < nbEpisodes;
      },
    ).sorted(
      (a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0),
    );

    return [
      for (final entry in anilistEntries)
        MediaListEntry(
          updatedAt: entry.updatedAt,
          progress: entry.progress,
          media: await tmdb.hydrateMediaWithTmdb(
            Media(anilistInfo: entry.media),
          ),
        ),
    ];
  }

  List<MediaListEntry> getStartList(
    AnilistWatchList watchList,
  ) {
    final season = currentSeason();
    final year = DateTime.now().year;
    final planningList = watchList.planning;

    final seasonEntries = planningList
        .where((element) {
          return element.media?.season == season &&
              element.media?.seasonYear == year &&
              element.media?.nextAiringEpisode?.episode != 1 &&
              element.progress == 0;
        })
        .map((element) => MediaListEntry.fromAnilistListEntry(element))
        .toList();

    if (seasonEntries.isNotEmpty) return seasonEntries;

    return watchList.planning
        .map((element) => MediaListEntry.fromAnilistListEntry(element))
        .toList();
  }

  Future<AnilistWatchList> toggleFavourite(
    AnilistWatchList watchList,
    int mediaId,
  ) async {
    try {
      await anilist.toggleFavourite(mediaId: mediaId);

      AnilistWatchListEntry updateFavourite(AnilistWatchListEntry entry) {
        if (entry.media?.id == mediaId) {
          return entry.copyWith(
            media: entry.media?.copyWith(
                isFavourite: entry.media?.isFavourite == null
                    ? true
                    : !entry.media!.isFavourite),
          );
        }

        return entry;
      }

      return watchList.copyWith(
        completed: watchList.completed.map(updateFavourite).toList(),
        current: watchList.current.map(updateFavourite).toList(),
        dropped: watchList.dropped.map(updateFavourite).toList(),
        paused: watchList.paused.map(updateFavourite).toList(),
        planning: watchList.planning.map(updateFavourite).toList(),
        repeating: watchList.repeating.map(updateFavourite).toList(),
      );
    } on AnilistToggleFavouriteException {
      rethrow;
    } catch (e) {
      throw AnilistToggleFavouriteException(
        error: e.toString(),
      );
    }
  }
}
