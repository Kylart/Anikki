import 'package:anikki/core/providers/anilist/anilist.dart';

import 'package:anikki/features/news/models/news_options.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/core/helpers/anilist/filters/filters.dart';

typedef NewsEntry = Query$AiringSchedule$Page$airingSchedules;

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
      included =
          included && entry.media?.isAdult != null && !entry.media!.isAdult!;
    }

    if (options.showOnlyJap) {
      included = included && entry.media?.countryOfOrigin == 'JP';
    }

    return included;
  }).toList();
}
