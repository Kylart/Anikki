part of 'anilist.dart';

mixin AnilistActivities on AnilistClient {
  Future<List<Query$GetActivities$Page$activities$$ListActivity>> getActivities(
    int userId, [
    int? page = 1,
  ]) async {
    try {
      final result = await client.query$GetActivities(
        Options$Query$GetActivities(
          variables: Variables$Query$GetActivities(
            userId: userId,
            page: page,
          ),
        ),
      );

      if (result.hasException) {
        throw AnilistGetActvitiesException(error: result.exception.toString());
      }

      return result.parsedData?.Page?.activities
              ?.whereType<Query$GetActivities$Page$activities$$ListActivity>()
              .where((e) => e.media != null)
              .toList() ??
          [];
    } catch (e) {
      throw AnilistGetActvitiesException(error: e.toString());
    }
  }
}
