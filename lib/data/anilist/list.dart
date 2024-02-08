part of 'anilist.dart';

mixin AnilistList on AnilistClient {
  /// This method only notifies Anilist that the entry with `mediaId` was watched
  /// with `episode`.
  /// It does not set anything else.
  ///
  /// throws [AnilistUpdateListException]
  Future<void> updateEntry({
    required int episode,
    required int mediaId,
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

        switch (status) {
          case Enum$MediaListStatus.CURRENT:
            watchList = watchList.copyWith(
              current:
                  list?.entries?.whereType<AnilistWatchListEntry>().toList() ??
                      [],
            );
            break;
          case Enum$MediaListStatus.PLANNING:
            watchList = watchList.copyWith(
              planning:
                  list?.entries?.whereType<AnilistWatchListEntry>().toList() ??
                      [],
            );
            break;
          case Enum$MediaListStatus.COMPLETED:
            watchList = watchList.copyWith(
              completed:
                  list?.entries?.whereType<AnilistWatchListEntry>().toList() ??
                      [],
            );
            break;
          case Enum$MediaListStatus.DROPPED:
            watchList = watchList.copyWith(
              dropped:
                  list?.entries?.whereType<AnilistWatchListEntry>().toList() ??
                      [],
            );
            break;
          case Enum$MediaListStatus.PAUSED:
            watchList = watchList.copyWith(
              paused:
                  list?.entries?.whereType<AnilistWatchListEntry>().toList() ??
                      [],
            );
            break;
          case Enum$MediaListStatus.REPEATING:
            watchList = watchList.copyWith(
              repeating:
                  list?.entries?.whereType<AnilistWatchListEntry>().toList() ??
                      [],
            );
            break;
          default:
            break;
        }
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
