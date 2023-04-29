import 'package:graphql/client.dart';

import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/exceptions.dart';
import 'package:anilist/src/models/models.dart';

mixin AnilistList on AnilistClient {
  /// This method only notifies Anilist that the entry with `mediaId` was watched
  /// with `episode`.
  /// It does not set anything else.
  ///
  /// throws [AnilistUpdateListException]
  Future<void> watchedEntry(
      {required int episode, required int mediaId}) async {
    try {
      await client.mutate$UpdateEntry(
        Options$Mutation$UpdateEntry(
          variables: Variables$Mutation$UpdateEntry(
            mediaId: mediaId,
            progress: episode,
            status: Enum$MediaListStatus.CURRENT,
          ),
        ),
      );
    } on GraphQLError catch (e) {
      throw AnilistUpdateListException(error: e.message);
    }
  }

  Future<
          Map<Enum$MediaListStatus,
              List<Query$GetLists$MediaListCollection$lists$entries>>>
      getWatchLists(String username, {bool useCache = true}) async {
    try {
      Map<Enum$MediaListStatus,
          List<Query$GetLists$MediaListCollection$lists$entries>> watchList = {
        Enum$MediaListStatus.COMPLETED: [],
        Enum$MediaListStatus.CURRENT: [],
        Enum$MediaListStatus.DROPPED: [],
        Enum$MediaListStatus.PAUSED: [],
        Enum$MediaListStatus.PLANNING: [],
        Enum$MediaListStatus.REPEATING: [],
      };

      final result = await client.query$GetLists(
        Options$Query$GetLists(
            variables: Variables$Query$GetLists(username: username),
            fetchPolicy: useCache ? null : FetchPolicy.noCache),
      );

      if (result.parsedData?.MediaListCollection?.lists == null) {
        throw result.exception?.graphqlErrors[0].message ??
            'Could not retrieve list';
      }

      for (final list in result.parsedData!.MediaListCollection!.lists!) {
        final status = list?.entries?.first?.status;
        if (status == null) continue;

        watchList[status] = list?.entries
                ?.whereType<Query$GetLists$MediaListCollection$lists$entries>()
                .toList() ??
            [];
      }

      return watchList;
    } catch (e) {
      throw AnilistGetListException(error: e.toString());
    }
  }
}
