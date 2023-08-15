part of 'anilist.dart';

mixin AnilistTrending on AnilistClient {
  Future<List<Query$Trending$Page$mediaTrends>> getTrending() async {
    try {
      final result = await client.query$Trending(
        Options$Query$Trending(
          variables: Variables$Query$Trending(
            page: 1,
          ),
        ),
      );

      if (result.hasException) {
        throw AnilistGetTrendingException(error: result.exception.toString());
      }

      return result.parsedData?.Page?.mediaTrends
              ?.whereType<Query$Trending$Page$mediaTrends>()
              .toList() ??
          [];
    } catch (e) {
      throw AnilistGetTrendingException(error: e.toString());
    }
  }
}
