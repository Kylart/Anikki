import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist_client.dart';

mixin WatchListStore on AnilistClient {
  bool shouldFetch = true;
  Map<AnilistMediaListStatus, List<AnilistListEntry>> watchList = {
    AnilistMediaListStatus.completed: [],
    AnilistMediaListStatus.current: [],
    AnilistMediaListStatus.dropped: [],
    AnilistMediaListStatus.paused: [],
    AnilistMediaListStatus.planning: [],
    AnilistMediaListStatus.repeating: [],
  };

  List<AnilistListEntry> get currentList =>
      watchList[AnilistMediaListStatus.current]!;
  List<AnilistListEntry> get completedList =>
      watchList[AnilistMediaListStatus.completed]!;
  List<AnilistListEntry> get droppedList =>
      watchList[AnilistMediaListStatus.dropped]!;
  List<AnilistListEntry> get pausedList =>
      watchList[AnilistMediaListStatus.paused]!;
  List<AnilistListEntry> get planningList =>
      watchList[AnilistMediaListStatus.planning]!;
  List<AnilistListEntry> get repeatingList =>
      watchList[AnilistMediaListStatus.repeating]!;

  Future<Map<AnilistMediaListStatus, List<AnilistListEntry>>> getWatchLists() async {
    if (isConnected && shouldFetch) {
      watchList = await provider.getWatchLists(me!.name);
      shouldFetch = false;
      notifyListeners();
    }

    return watchList;
  }
  
  Future<void> refreshWatchLists () async {
    shouldFetch = true;
    await getWatchLists();
  }
}
