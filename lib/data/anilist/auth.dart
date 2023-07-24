part of 'anilist.dart';

mixin AnilistAuth on AnilistClient {
  Future<Query$Viewer$Viewer> getMe() async {
    final result = await client.query$Viewer(Options$Query$Viewer());

    if (result.hasException || result.parsedData?.Viewer == null) {
      throw AnilistNotConnectedException();
    }

    return result.parsedData!.Viewer!;
  }
}
