import 'package:anikki/core/providers/anilist/anilist.dart';

import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';

bool isSeen(
    WatchListComplete lists, Query$AiringSchedule$Page$airingSchedules entry) {
  final listEntry =
      lists.current.where((element) => element.media?.id == entry.media?.id);
  final isCompleted =
      lists.completed.where((e) => e.media?.id == entry.media?.id).isNotEmpty;

  return (listEntry.isNotEmpty &&
          (listEntry.first.progress ?? -1) >= entry.episode) ||
      isCompleted;
}
