import 'package:flutter/material.dart';

import 'package:anikki/components/shared/download_results_dialog/download_results_dialog.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';

void showAvailableTorrents(BuildContext context, ScheduleEntry entry) {
  if (entry.media?.title == null) return;

  showDialog<Dialog>(
    context: context,
    builder: (BuildContext context) {
      return DownloadResultsDialog(
        episode: entry.episode,
        term: '${entry.media!.title!.title()} ${entry.episode}',
      );
    },
  );
}
