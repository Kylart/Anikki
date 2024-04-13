import 'package:collection/collection.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class AnilistUtils {
  static AnilistWatchListEntry? getListEntry(
    List<AnilistWatchListEntry> entries,
    Media media,
  ) {
    return entries.firstWhereOrNull(
      (element) => element.media?.id == media.anilistInfo.id,
    );
  }

  static AnilistWatchListEntry? getCurrentEntry(
    WatchListState state,
    Media media,
  ) {
    return AnilistUtils.getListEntry(state.current, media) ??
        AnilistUtils.getListEntry(state.repeating, media) ??
        AnilistUtils.getListEntry(state.paused, media) ??
        AnilistUtils.getListEntry(state.dropped, media);
  }

  static AnilistWatchListEntry? getCompletedEntry(
    WatchListState state,
    Media media,
  ) {
    return AnilistUtils.getListEntry(state.completed, media);
  }
}
