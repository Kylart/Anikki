part of 'anilist.dart';

mixin AnilistRecommendations on AnilistClient {
  Future<List<Query$Recommendations$Page$recommendations>>
      getRecommendations() async {
    try {
      final result = await client.query$Recommendations(
        Options$Query$Recommendations(
          variables: Variables$Query$Recommendations(
            page: 1,
          ),
        ),
      );

      if (result.hasException) {
        throw AnilistGetRecommendationsException(
          error: result.exception.toString(),
        );
      }

      return result.parsedData?.Page?.recommendations
              ?.whereType<Query$Recommendations$Page$recommendations>()
              .toList() ??
          [];
    } catch (e) {
      throw AnilistGetRecommendationsException(error: e.toString());
    }
  }
}
