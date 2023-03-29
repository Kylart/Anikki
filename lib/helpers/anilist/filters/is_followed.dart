import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist.dart';

bool isFollowed(AnilistStore store, ScheduleEntry entry) {
  return [...store.planningList, ...store.currentList]
      .map(
        (e) => e.media.id,
      )
      .contains(entry.media.id);
}
