import 'package:flutter/material.dart';

import 'package:kawanime/components/shared/download_results_dialog/download_results_dialog.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';

void showAvailableTorrents(BuildContext context, ScheduleEntry entry) {
  if (entry.media?.title == null) return;

  showDialog<Dialog>(
    context: context,
    builder: (BuildContext context) {
      return DownloadResultsDialog(
        term: '${entry.media!.title!.toNyaaTerm()} + ${entry.episode}',
      );
    },
  );
}
