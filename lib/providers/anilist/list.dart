import 'package:graphql/client.dart';

import 'package:anikki/helpers/errors/anilist_update_list_exception.dart';
import 'package:anikki/providers/anilist/anilist_client.dart';
import 'package:anikki/providers/anilist/queries/update_list_entry.dart';

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
}
