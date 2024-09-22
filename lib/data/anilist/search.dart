part of 'anilist.dart';

mixin AnilistSearch on AnilistClient {
  Future<Map<AnilistSearchPart, List<Object>>> search(String term) async {
    try {
      final Map<AnilistSearchPart, List<Object>> result = {
        AnilistSearchPart.staffs: [],
        AnilistSearchPart.characters: [],
        AnilistSearchPart.animes: [],
      };

      final query = await client.query$Search(
        Options$Query$Search(
          variables: Variables$Query$Search(
            search: term,
          ),
        ),
      );

      if (query.parsedData == null && query.hasException) {
        throw query.exception?.graphqlErrors[0].message ??
            'Could not retrieve list';
      }

      result[AnilistSearchPart.animes] = query.parsedData?.anime?.results
              ?.whereType<Fragment$media>()
              .toList() ??
          [];

      result[AnilistSearchPart.characters] = query
              .parsedData?.characters?.results
              ?.whereType<Query$Search$characters$results>()
              .toList() ??
          [];

      result[AnilistSearchPart.staffs] = query.parsedData?.staff?.results
              ?.whereType<Query$Search$staff$results>()
              .toList() ??
          [];

      return result;
    } catch (e) {
      throw AnilistSearchException(error: e.toString());
    }
  }
}
