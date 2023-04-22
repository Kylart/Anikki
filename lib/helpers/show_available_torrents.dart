import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/widgets/fade_overlay.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/download_results_dialog/download_results.dart';
import 'package:anikki/models/local_file.dart';

void showAvailableTorrents<T>(BuildContext context, T rawEntry) {
  Widget? downloadResults;

  switch (T) {
    case Query$AiringSchedule$Page$airingSchedules:
      final entry = rawEntry as Query$AiringSchedule$Page$airingSchedules;

      downloadResults = DownloadResults(
        episode: entry.episode >= 0 ? entry.episode : null,
        term:
            '${entry.media?.title?.userPreferred} ${entry.episode >= 0 ? entry.episode : ''}',
      );
      break;

    case Query$GetLists$MediaListCollection$lists$entries:
      final entry =
          rawEntry as Query$GetLists$MediaListCollection$lists$entries;

      downloadResults = DownloadResults(
        episode: entry.status == Enum$MediaListStatus.CURRENT
            ? entry.progress == null
                ? null
                : entry.progress! + 1
            : null,
        term: entry.media?.title?.userPreferred ?? '',
      );
      break;

    case LocalFile:
      final entry = rawEntry as LocalFile;

      downloadResults = DownloadResults(
        episode: entry.episode,
        term: entry.title!,
      );
      break;
  }

  if (downloadResults != null) {
    if (isDesktop()) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: downloadResults,
          );
        },
      );
    } else {
      Navigator.of(context).push(
        FadeOverlay(
          child: downloadResults,
        ),
      );
    }
  }
}
