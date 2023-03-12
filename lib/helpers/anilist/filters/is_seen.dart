import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist.dart';

bool isSeen(AnilistStore store, ScheduleEntry entry) {
  final listEntry =
      store.currentList.where((element) => element.media.id == entry.media?.id);

  if (listEntry.isEmpty) {
    return false;
  } else {
    if (listEntry.first.progress != null &&
        listEntry.first.progress! > entry.episode!) {
      return false;
    }
  }

  return true;
}
