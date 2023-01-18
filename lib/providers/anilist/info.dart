import 'package:flutter/cupertino.dart';

import 'package:graphql/client.dart';

import 'package:kawanime/helpers/hash.dart';
import 'package:kawanime/providers/anilist/queries/media.dart';
import 'package:kawanime/providers/anilist/types/media/media.dart';

class AnilistInfo {
  AnilistInfo({required GraphQLClient client}) {
    _client = client;
  }

  late GraphQLClient _client;

  Future<Map<String, Media>> fromMultiple(List<String> names) async {
    Map<String, Media> results = {};
    String query = '';

    int currentIndex = 0;
    int interval = 9;
    List<String> tempNames = [];

    Future<QueryResult> makeQuery(List<String> names) async {
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

      final QueryResult result = await _client.query(options);

      return result;
    }

    while (currentIndex < names.length) {
      if (currentIndex + interval > names.length) interval = -1;

      tempNames = names.sublist(currentIndex,
          interval == -1 ? names.length : currentIndex + interval);

      final QueryResult result = await makeQuery(tempNames);

      if (result.data == null) throw ErrorSummary('No results.');

      result.data?.forEach((key, value) {
        if (results.containsKey(key)) return;
        if (key == '__typename') return;

        final data = value['media'];

        if (data.length == 0) return;

        results.putIfAbsent(key, () => Media.fromMap(data[0]));
      });

      if (interval != -1) {
        currentIndex += interval;
      } else {
        break;
      }
      query = '';
    }

    return results;
  }
}
