import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/anilist_get_info_exception.dart';
import 'package:anilist/src/models/models.dart';
import 'package:anilist/src/queries/media.dart';
import 'package:anilist/src/utils/hash.dart';

import 'package:graphql/client.dart';

mixin AnilistInfo on AnilistClient {
  Future<Map<String, Media>> infoFromMultiple(List<String> names) async {
    Map<String, Media> results = {};

    int currentIndex = 0;
    int interval = 5;
    List<String> tempNames = [];

    while (currentIndex < names.length) {
      if (currentIndex + interval > names.length) interval = -1;

      tempNames = names.sublist(currentIndex,
          interval == -1 ? names.length : currentIndex + interval);

      final QueryResult result = await _makeInfoQuery(tempNames);

      if (result.data == null) {
        throw AnilistGetInfoException(
            error: result.exception?.graphqlErrors.first.message);
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

  Future<QueryResult> _makeInfoQuery(List<String> names) async {
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
