import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/download_results_dialog/download_results_dialog.dart';
import 'package:anikki/models/local_file.dart';

void showAvailableTorrents<T>(BuildContext context, T entry) {
  showDialog<Dialog>(
    context: context,
    builder: (BuildContext context) {
      if (T == ScheduleEntry) {
        final typedEntry = entry as ScheduleEntry;
        return DownloadResultsDialog(
          episode: typedEntry.episode,
          term:
              '${typedEntry.media!.title!.title()} ${typedEntry.episode ?? ''}',
        );
      }

      if (T == AnilistListEntry) {
        final typedEntry = entry as AnilistListEntry;
        return DownloadResultsDialog(
          episode: entry.status == AnilistMediaListStatus.current
              ? entry.progress == null
                  ? null
                  : entry.progress! + 1
              : null,
          term: typedEntry.media.title!.title(),
        );
      }

      if (T == LocalFile) {
        final typedEntry = entry as LocalFile;

        if (typedEntry.title == null) return const SizedBox();

        return DownloadResultsDialog(
          episode: typedEntry.episode != null &&
                  int.tryParse(typedEntry.episode!) != null
              ? int.tryParse(typedEntry.episode!)! + 1
              : null,
          term: typedEntry.title!,
        );
      }

      return const SizedBox();
    },
  );
}
