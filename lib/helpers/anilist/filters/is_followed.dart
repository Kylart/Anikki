import 'package:anilist/anilist.dart';
import 'package:collection/collection.dart';

import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';

bool isFollowed(
    WatchListComplete lists, Query$AiringSchedule$Page$airingSchedules entry) {
  return [...lists.planning, ...lists.current]
      .whereNot((e) => e.media == null)
      .map(
        (e) => e.media!.id,
      )
      .contains(entry.media?.id);
}
