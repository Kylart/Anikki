import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist_client.dart';

mixin WatchListStore on AnilistClient {
  bool shouldFetch = true;
  Map<Enum$MediaListStatus,
      List<Query$GetLists$MediaListCollection$lists$entries>> watchList = {
    Enum$MediaListStatus.COMPLETED: [],
    Enum$MediaListStatus.CURRENT: [],
    Enum$MediaListStatus.DROPPED: [],
    Enum$MediaListStatus.PAUSED: [],
    Enum$MediaListStatus.PLANNING: [],
    Enum$MediaListStatus.REPEATING: [],
  };

  List<Query$GetLists$MediaListCollection$lists$entries> get currentList =>
      watchList[Enum$MediaListStatus.CURRENT]!;
  List<Query$GetLists$MediaListCollection$lists$entries> get completedList =>
      watchList[Enum$MediaListStatus.COMPLETED]!;
  List<Query$GetLists$MediaListCollection$lists$entries> get droppedList =>
      watchList[Enum$MediaListStatus.DROPPED]!;
  List<Query$GetLists$MediaListCollection$lists$entries> get pausedList =>
      watchList[Enum$MediaListStatus.PAUSED]!;
  List<Query$GetLists$MediaListCollection$lists$entries> get planningList =>
      watchList[Enum$MediaListStatus.PLANNING]!;
  List<Query$GetLists$MediaListCollection$lists$entries> get repeatingList =>
      watchList[Enum$MediaListStatus.REPEATING]!;

  Future<
          Map<Enum$MediaListStatus,
              List<Query$GetLists$MediaListCollection$lists$entries>>>
      getWatchLists() async {
    if (isConnected && shouldFetch) {
      watchList = await provider.getWatchLists(me!.name, useCache: false);
      shouldFetch = false;
      notifyListeners();
    }

    return watchList;
  }

  Future<void> refreshWatchLists() async {
    shouldFetch = true;
    await getWatchLists();
  }
}
