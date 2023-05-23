import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/anilist_get_info_exception.dart';
import 'package:anilist/src/models/models.dart';
import 'package:anilist/src/utils/hash.dart';

import 'package:graphql/client.dart';

mixin AnilistInfo on AnilistClient {
  Fragment$shortMedia? getInfoFromInfo(
      String name, Map<String, Fragment$shortMedia> info) {
    return info[getId(name: name)];
  }

  Future<Map<String, Fragment$shortMedia>> infoFromMultiple(
      List<String> names) async {
    Map<String, Fragment$shortMedia> results = {};

    int currentIndex = 0;
    int interval = 5;
    List<String> tempNames = [];

    while (currentIndex < names.length) {
      if (currentIndex + interval > names.length) interval = -1;

      tempNames = names.sublist(currentIndex,
          interval == -1 ? names.length : currentIndex + interval);

      final QueryResult result = await _makeInfoQuery(tempNames);

      if (result.data == null && result.exception != null) {
        throw AnilistGetInfoException(
            error: result.exception!.graphqlErrors.isEmpty
                ? result.exception!.linkException.toString()
                : result.exception!.graphqlErrors.first.message);
      } else {
        result.data?.forEach((key, value) {
          if (results.containsKey(key)) return;
          if (key == '__typename') return;

          final data = value['media'];

          if (data.length == 0) return;

          results.putIfAbsent(key, () => Fragment$shortMedia.fromJson(data[0]));
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
            ...shortMedia
          }
        }
      ''';
    }

    query = '''
      query {
        $query
      }

      fragment shortMedia on Media {
        id
        siteUrl
        idMal
        title {
          userPreferred
          romaji
          english
          native
        }
        coverImage {
          extraLarge
          large
          medium
          color
        }
        bannerImage
        genres
        synonyms
        isAdult
        format
        description
        source
        episodes
        nextAiringEpisode {
          airingAt
          episode
        }
        studios(isMain: true) {
          nodes {
            name
          }
        }
        countryOfOrigin
        startDate {
          year
          month
          day
        }
      }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await client.query(options);

    return result;
  }
}
