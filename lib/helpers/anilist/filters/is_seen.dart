import 'package:anilist/anilist.dart';

import 'package:anikki/providers/anilist/anilist.dart';

bool isSeen(AnilistStore store, ScheduleEntry entry) {
  final listEntry =
      store.currentList.where((element) => element.media.id == entry.media.id);

  return listEntry.isNotEmpty &&
      (listEntry.first.progress ?? -1) >= entry.episode!;
}
