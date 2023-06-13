import 'package:anikki/features/news/domain/models/models.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';

bool isFollowed(WatchListComplete watchList, NewsEntry entry) {
  return [...watchList.planning, ...watchList.current]
      .where((element) => element.media?.id == entry.media.anilistInfo.id)
      .isNotEmpty;
}

bool isSeen(WatchListComplete watchList, NewsEntry entry) {
  if (entry.episode == null) return false;

  final listEntry = watchList.current
      .where((element) => element.media?.id == entry.media.anilistInfo.id);

  final isCompleted = watchList.completed
      .where((e) => e.media?.id == entry.media.anilistInfo.id)
      .isNotEmpty;

  return (listEntry.isNotEmpty &&
          (listEntry.first.progress ?? -1) >= entry.episode!) ||
      isCompleted;
}

List<NewsEntry> filterEntries(
  List<NewsEntry> entries,
  NewsOptions options,
  WatchListComplete? watchList,
) {
  return entries.where((entry) {
    bool included = true;

    if (watchList != null) {
      if (options.showOnlyBookmarked) {
        included = isFollowed(watchList, entry);
      }

      if (options.showOnlyUnseen) {
        included = included &&
            isFollowed(watchList, entry) &&
            !isSeen(watchList, entry);
      }
    }

    if (!options.showAdult) {
      included = included &&
          entry.media.anilistInfo.isAdult != null &&
          !entry.media.anilistInfo.isAdult!;
    }

    if (options.showOnlyJap) {
      included = included && entry.media.anilistInfo.countryOfOrigin == 'JP';
    }

    return included;
  }).toList();
}
