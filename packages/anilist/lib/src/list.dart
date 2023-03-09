import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/exceptions.dart';
import 'package:anilist/src/models/models.dart';
import 'package:anilist/src/queries/get_list.dart';
import 'package:anilist/src/queries/update_list_entry.dart';
import 'package:graphql/client.dart';

mixin AnilistList on AnilistClient {
  /// This method only notifies Anilist that the entry with `mediaId` was watched
  /// with `episode`.
  /// It does not set anything else.
  ///
  /// throws [AnilistUpdateListException]
  Future<void> watchedEntry(
      {required int episode, required int mediaId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(updateListEntryQuery),
        variables: <String, dynamic>{
          'mediaId': mediaId,
          'progress': episode,
        },
      );

      await client.query(options);
    } on GraphQLError catch (e) {
      throw AnilistUpdateListException(error: e.message);
    }
  }

  Future<Map<AnilistMediaListStatus, List<AnilistListEntry>>> getWatchLists(
      String username) async {
    try {
      Map<AnilistMediaListStatus, List<AnilistListEntry>> watchList = {
        AnilistMediaListStatus.completed: [],
        AnilistMediaListStatus.current: [],
        AnilistMediaListStatus.dropped: [],
        AnilistMediaListStatus.paused: [],
        AnilistMediaListStatus.planning: [],
        AnilistMediaListStatus.repeating: [],
      };

      final QueryOptions options = QueryOptions(
        document: gql(getListQuery),
        variables: <String, dynamic>{
          'username': username,
        },
      );

      final result = await client.query(options);

      if (result.data == null) {
        throw result.exception?.graphqlErrors[0].message ??
            'Could not retrieve list';
      }

      final List<dynamic> rawLists =
          result.data?['MediaListCollection']['lists'];

      for (final list in rawLists) {
        final List<dynamic>? rawList = list['entries'];

        if (rawList == null) continue;

        final List<AnilistListEntry> mediaList =
            rawList.map((entry) => AnilistListEntry.fromMap(entry)).toList();

        final listStatus = mediaList[0].status;

        watchList[listStatus] = mediaList;
      }

      return watchList;
    } on GraphQLError catch (e) {
      throw AnilistGetListException(error: e.message);
    }
  }
}
