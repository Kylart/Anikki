import 'package:flutter/cupertino.dart';

import 'package:graphql/client.dart';

import 'package:anikki/helpers/hash.dart';
import 'package:anikki/providers/anilist/queries/media.dart';
import 'package:anikki/providers/anilist/types/media/media.dart';

class AnilistInfo {
  AnilistInfo({required this.client});

  final GraphQLClient client;

  Future<Map<String, Media>> fromMultiple(List<String> names) async {
    Map<String, Media> results = {};

    int currentIndex = 0;
    int interval = 5;
    List<String> tempNames = [];

    while (currentIndex < names.length) {
      if (currentIndex + interval > names.length) interval = -1;

      tempNames = names.sublist(currentIndex,
          interval == -1 ? names.length : currentIndex + interval);

      final QueryResult result = await makeQuery(tempNames);

      if (result.data == null) {
        throw ErrorSummary('An error occurred');
      } else {
        result.data?.forEach((key, value) {
          if (results.containsKey(key)) return;
          if (key == '__typename') return;

          final data = value['media'];

          if (data.length == 0) return;

          results.putIfAbsent(key, () => Media.fromMap(data[0]));
        });
      }

      if (interval != -1) {
        currentIndex += interval;
      } else {
        break;
      }
    }

    return results;
  }

  Future<QueryResult> makeQuery(List<String> names) async {
    String query = '';

    for (final name in names) {
      final String id = getId(name: name);

      query += '''
        $id: Page(page: 1, perPage: 1) {
          media(search: "$name", type: ANIME) {
            ...media
          }
        }
      ''';
    }

    query = '''
      query {
        $query
      }

      $mediaFragment
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await client.query(options);

    return result;
  }
}
