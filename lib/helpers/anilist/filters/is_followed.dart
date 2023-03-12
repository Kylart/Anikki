import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist.dart';

bool isFollowed(AnilistStore store, ScheduleEntry entry) {
  final followedEntries = [...store.planningList, ...store.currentList].map(
    (e) => e.media.id,
  );

  if (!followedEntries.contains(entry.media?.id)) return false;

  return true;
}
