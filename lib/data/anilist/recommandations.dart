part of 'anilist.dart';

mixin AnilistRecommandations on AnilistClient {
  Future<List<Query$Recommendations$Page$recommendations>>
      getRecommandations() async {
    try {
      final result = await client.query$Recommendations(
        Options$Query$Recommendations(
          variables: Variables$Query$Recommendations(
            page: 1,
          ),
        ),
      );

      if (result.hasException) {
        throw AnilistGetRecommandationsException(
            error: result.exception.toString());
      }

      return result.parsedData?.Page?.recommendations
              ?.whereType<Query$Recommendations$Page$recommendations>()
              .toList() ??
          [];
    } catch (e) {
      throw AnilistGetRecommandationsException(error: e.toString());
    }
  }
}
