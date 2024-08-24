part of 'anilist.dart';

mixin AnilistList on AnilistClient {
  /// This method only notifies Anilist that the entry with `mediaId` was watched
  /// with `episode`.
  /// It does not set anything else.
  ///
  /// throws [AnilistUpdateListException]
  Future<void> updateEntry({
    required int mediaId,
    int? episode,
    Enum$MediaListStatus? status,
  }) async {
    try {
      final result = await client.mutate$UpdateEntry(
        Options$Mutation$UpdateEntry(
          variables: Variables$Mutation$UpdateEntry(
            mediaId: mediaId,
            progress: episode,
            status: status,
          ),
        ),
      );

      if (result.hasException) throw result.exception!;
    } on GraphQLError catch (e) {
      throw AnilistUpdateListException(error: e.message);
    } on OperationException catch (e) {
      throw AnilistUpdateListException(error: e.toString());
    }
  }

  Future<void> toggleFavourite({
    required int mediaId,
  }) async {
    try {
      await client.mutate$ToggleFavourite(
        Options$Mutation$ToggleFavourite(
          variables: Variables$Mutation$ToggleFavourite(
            animeId: mediaId,
          ),
        ),
      );
    } on GraphQLError catch (e) {
      throw AnilistToggleFavouriteException(error: e.message);
    } on OperationException catch (e) {
      throw AnilistToggleFavouriteException(error: e.toString());
    }
  }

  Future<AnilistWatchList> getWatchLists(
    String username, {
    bool useCache = true,
  }) async {
    try {
      var watchList = const AnilistWatchList();

      final result = await client.query$GetLists(
        Options$Query$GetLists(
          variables: Variables$Query$GetLists(username: username),
          fetchPolicy: useCache ? null : FetchPolicy.noCache,
        ),
      );

      if (result.hasException) throw result.exception!;

      for (final list in result.parsedData!.MediaListCollection!.lists!) {
        final status = list?.entries?.first?.status;
        if (status == null) continue;

        final entries =
            list?.entries?.whereType<AnilistWatchListEntry>().toList() ?? [];

        watchList = switch (status) {
          Enum$MediaListStatus.CURRENT => watchList.copyWith(current: entries),
          Enum$MediaListStatus.PLANNING =>
            watchList.copyWith(planning: entries),
          Enum$MediaListStatus.COMPLETED =>
            watchList.copyWith(completed: entries),
          Enum$MediaListStatus.DROPPED => watchList.copyWith(dropped: entries),
          Enum$MediaListStatus.PAUSED => watchList.copyWith(paused: entries),
          Enum$MediaListStatus.REPEATING =>
            watchList.copyWith(repeating: entries),
          Enum$MediaListStatus.$unknown => watchList,
        };
      }

      return watchList;
    } catch (e) {
      logger.warning('getWatchList error', e);
      throw AnilistGetListException(
        error: 'Something went wrong while retrieing watch lsit information',
      );
    }
  }
}
