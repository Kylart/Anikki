import 'package:flutter/material.dart';

import 'package:graphql/client.dart';

import 'package:anikki/helpers/errors/anilist_get_list_exception.dart';
import 'package:anikki/providers/anilist/queries/get_list.dart';
import 'package:anikki/providers/anilist/types/list_entry.dart';
import 'package:anikki/providers/anilist/types/media_list_status.dart';
import 'package:anikki/helpers/errors/anilist_update_list_exception.dart';
import 'package:anikki/providers/anilist/anilist_client.dart';
import 'package:anikki/providers/anilist/queries/update_list_entry.dart';

mixin AnilistList on AnilistClient, ChangeNotifier {
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

  bool _isWatchListLoading = false;

  bool get isWatchListLoading => _isWatchListLoading;

  set isWatchListLoading(bool value) {
    _isWatchListLoading = value;
    notifyListeners();
  }

  AnilistGetListException? _watchListLoadError;

  AnilistGetListException? get watchListLoadError => _watchListLoadError;

  set watchListLoadError(AnilistGetListException? value) {
    _watchListLoadError = value;
    notifyListeners();
  }

  Map<AnilistMediaListStatus, List<AnilistListEntry>> watchList = {
    AnilistMediaListStatus.completed: [],
    AnilistMediaListStatus.current: [],
    AnilistMediaListStatus.dropped: [],
    AnilistMediaListStatus.paused: [],
    AnilistMediaListStatus.planning: [],
    AnilistMediaListStatus.repeating: [],
  };

  List<AnilistListEntry> get currentList => watchList[AnilistMediaListStatus.current]!;
  List<AnilistListEntry> get completedList => watchList[AnilistMediaListStatus.completed]!;

  Future<void> getWatchLists(username) async {
    try {
      isWatchListLoading = true;

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
    } on GraphQLError catch (e) {
      throw AnilistGetListException(error: e.message);
    } finally {
      isWatchListLoading = false;
    }
  }
}
