import 'package:anikki/core/core.dart';
import 'package:anikki/features/news/domain/models/news_options.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';

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
