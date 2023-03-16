import 'package:anikki/components/fade_overlay.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/download_results_dialog/download_results.dart';
import 'package:anikki/models/local_file.dart';

void showAvailableTorrents<T>(BuildContext context, T entry) {
  switch(T) {
    case ScheduleEntry:
      _fromNews(context, entry as ScheduleEntry);
      break;
    case AnilistListEntry:
      _fromListEntry(context, entry as AnilistListEntry);
      break;
    case LocalFile:
      _fromLibrary(context, entry as LocalFile);
      break;
  }
}

void _fromNews(BuildContext context, ScheduleEntry entry) {
  if (isDesktop()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: DownloadResults(
            episode: entry.episode,
            term: '${entry.media!.title!.title()} ${entry.episode ?? ''}',
          ),
        );
      },
    );
  } else {
    Navigator.of(context).push(
      FadeOverlay(
        child: DownloadResults(
          episode: entry.episode,
          term: '${entry.media!.title!.title()} ${entry.episode ?? ''}',
        ),
        onClose: () async {},
      ),
    );
  }
}

void _fromListEntry(BuildContext context, AnilistListEntry entry) {
  if (isDesktop()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: DownloadResults(
            episode: entry.status == AnilistMediaListStatus.current
                ? entry.progress == null
                    ? null
                    : entry.progress! + 1
                : null,
            term: entry.media.title!.title(),
          ),
        );
      },
    );
  } else {
    Navigator.of(context).push(
      FadeOverlay(
        child: DownloadResults(
          episode: entry.status == AnilistMediaListStatus.current
              ? entry.progress == null
                  ? null
                  : entry.progress! + 1
              : null,
          term: entry.media.title!.title(),
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
            episode:
                entry.episode != null && int.tryParse(entry.episode!) != null
                    ? int.tryParse(entry.episode!)! + 1
                    : null,
            term: entry.title!,
          ),
        );
      },
    );
  } else {
    Navigator.of(context).push(
      FadeOverlay(
        child: DownloadResults(
          episode: entry.episode != null && int.tryParse(entry.episode!) != null
              ? int.tryParse(entry.episode!)! + 1
              : null,
          term: entry.title!,
        ),
        onClose: () async {},
      ),
    );
  }
}
