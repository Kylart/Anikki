import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist.dart';
import 'package:collection/collection.dart';

bool isFollowed(
    AnilistStore store, Query$AiringSchedule$Page$airingSchedules entry) {
  return [...store.planningList, ...store.currentList]
      .whereNot((e) => e.media == null)
      .map(
        (e) => e.media!.id,
      )
      .contains(entry.media?.id);
}
