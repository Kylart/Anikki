import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/exceptions.dart';
import 'package:anilist/src/models/models.dart';
import 'package:anilist/src/queries/search.dart';
import 'package:graphql/client.dart';

mixin AnilistSearch on AnilistClient {
  Future<Map<AnilistSearchPart, List<Object>>> search(String term) async {
    try {
      final Map<AnilistSearchPart, List<Object>> result = {
        AnilistSearchPart.staffs: [],
        AnilistSearchPart.characters: [],
        AnilistSearchPart.animes: [],
      };

      final QueryOptions options = QueryOptions(
        document: gql(searchQuery),
        variables: <String, dynamic>{
          'search': term,
        },
      );

      final query = await client.query(options);

      if (query.data == null) {
        throw query.exception?.graphqlErrors[0].message ??
            'Could not retrieve list';
      }

      for (final part in AnilistSearchPart.values) {
        switch (part) {
          case AnilistSearchPart.animes:
            if (query.data!['anime'] != null &&
                (query.data!['anime']['results'] as List).isNotEmpty) {
              for (final media in (query.data!['anime']['results'] as List)) {
                result[AnilistSearchPart.animes]!.add(Media.fromMap(media));
              }
            }
            break;
          case AnilistSearchPart.staffs:
            if (query.data!['staff'] != null &&
                (query.data!['staff']['results'] as List).isNotEmpty) {
              for (final staff in (query.data!['staff']['results'] as List)) {
                result[AnilistSearchPart.staffs]!.add(Staff.fromMap(staff));
              }
            }
            break;
          case AnilistSearchPart.characters:
            if (query.data!['characters'] != null &&
                (query.data!['characters']['results'] as List).isNotEmpty) {
              for (final character
                  in (query.data!['characters']['results'] as List)) {
                result[AnilistSearchPart.characters]!
                    .add(Character.fromMap(character));
              }
            }
            break;
        }
      }

      return result;
    } on GraphQLError catch (e) {
      throw AnilistSearchException(error: e.message);
    }
  }
}
