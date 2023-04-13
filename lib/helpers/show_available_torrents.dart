import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/widgets/fade_overlay.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/download_results_dialog/download_results.dart';
import 'package:anikki/models/local_file.dart';

void showAvailableTorrents<T>(BuildContext context, T entry) {
  switch (T) {
    case Query$AiringSchedule$Page$airingSchedules:
      _fromNews(context, entry as Query$AiringSchedule$Page$airingSchedules);
      break;
    case Query$GetLists$MediaListCollection$lists$entries:
      _fromListEntry(
          context, entry as Query$GetLists$MediaListCollection$lists$entries);
      break;
    case LocalFile:
      _fromLibrary(context, entry as LocalFile);
      break;
  }
}

void _fromNews(
    BuildContext context, Query$AiringSchedule$Page$airingSchedules entry) {
  if (isDesktop()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Card(
            color: Theme.of(context).cardColor.withOpacity(0.85),
            child: DownloadResults(
              episode: entry.episode >= 0 ? entry.episode : null,
              term:
                  '${entry.media?.title?.userPreferred} ${entry.episode >= 0 ? entry.episode : ''}',
            ),
          ),
        );
      },
    );
  } else {
    Navigator.of(context).push(
      FadeOverlay(
        child: Card(
          child: DownloadResults(
            episode: entry.episode >= 0 ? entry.episode : null,
            term:
                '${entry.media?.title?.userPreferred} ${entry.episode >= 0 ? entry.episode : ''}',
          ),
        ),
        onClose: () async {},
      ),
    );
  }
}

void _fromListEntry(BuildContext context,
    Query$GetLists$MediaListCollection$lists$entries entry) {
  if (isDesktop()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: DownloadResults(
            episode: entry.status == Enum$MediaListStatus.CURRENT
                ? entry.progress == null
                    ? null
                    : entry.progress! + 1
                : null,
            term: entry.media?.title?.userPreferred ?? '',
          ),
        );
      },
    );
  } else {
    Navigator.of(context).push(
      FadeOverlay(
        child: DownloadResults(
          episode: entry.status == Enum$MediaListStatus.CURRENT
              ? entry.progress == null
                  ? null
                  : entry.progress! + 1
              : null,
          term: entry.media?.title?.userPreferred ?? '',
        ),
        onClose: () async {},
      ),
    );
  }
}

void _fromLibrary(BuildContext context, LocalFile entry) {
  if (isDesktop()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: DownloadResults(
            episode: entry.episode,
            term: entry.title!,
          ),
        );
      },
    );
  } else {
    Navigator.of(context).push(
      FadeOverlay(
        child: DownloadResults(
          episode: entry.episode,
          term: entry.title!,
        ),
        onClose: () async {},
      ),
    );
  }
}
