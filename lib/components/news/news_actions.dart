import 'package:flutter/material.dart';

import 'package:anikki/components/shared/download_results_dialog/download_results_dialog.dart';
import 'package:anikki/providers/anilist/types/list_entry.dart';
import 'package:anikki/providers/anilist/types/media_list_status.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';
import 'package:anikki/providers/local/types/file.dart';

void showAvailableTorrents<T>(BuildContext context, T entry) {
  showDialog<Dialog>(
    context: context,
    builder: (BuildContext context) {
      if (T == ScheduleEntry) {
        final typedEntry = entry as ScheduleEntry;
        return DownloadResultsDialog(
          episode: typedEntry.episode,
          term: '${typedEntry.media!.title!.title()} ${typedEntry.episode ?? ''}',
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
