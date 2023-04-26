import 'package:flutter/material.dart';

import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/models/local_file.dart';

AnikkiAction _playAction(BuildContext context, LocalFile entry) => AnikkiAction(
      callback: (context) {
        playFile(entry, context);
      },
      icon: Icons.play_arrow_outlined,
      label: 'Play episode',
    );

AnikkiAction _showTorrentsAction(BuildContext context, LocalFile entry) =>
    AnikkiAction(
      callback: (context) {
        showAvailableTorrents(context, entry);
      },
      icon: Icons.download_outlined,
      label: 'Show torrents',
    );

AnikkiAction _openBrowserAction(BuildContext context, LocalFile entry) =>
    AnikkiAction(
      callback: (context) {
        openInBrowser(entry.media?.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    );

AnikkiAction _deleteFileAction(BuildContext context, LocalFile entry) =>
    AnikkiAction(
      callback: (context) {
        deleteFile(entry, context);
      },
      icon: Icons.delete_outline,
      label: 'Delete file',
    );

AnikkiAction _deleteAllFilesAction(BuildContext context, LocalFile entry) =>
    AnikkiAction(
      callback: (context) {
        // TODO: Implement this when send to trash is available.
        throw UnimplementedError();
      },
      icon: Icons.delete_sweep_outlined,
      label: 'Delete all files',
      disabled: true,
    );

AnikkiAction _expandAction(
        BuildContext context, LocalFile entry, void Function() onShrink) =>
    AnikkiAction(
      callback: (context) {
        onShrink();
      },
      icon: Icons.expand_more,
      label: 'Show all episodes',
    );

/// Library actions that should be available only for non-expandables or expanded entries.
List<AnikkiAction> getLibraryActions(BuildContext context, LocalFile entry) {
  return [
    _playAction(context, entry),
    _showTorrentsAction(context, entry),
    _openBrowserAction(context, entry),
    _deleteFileAction(context, entry),
  ];
}

/// Library actions that should be available for expandable entries.
List<AnikkiAction> geExpandabletLibraryActions({
  required BuildContext context,
  required LocalFile entry,
  required void Function() onShrink,
}) {
  return [
    _expandAction(context, entry, onShrink),
    _playAction(context, entry),
    _showTorrentsAction(
      context,
      entry.copyWith(episode: null),
    ),
    _openBrowserAction(context, entry),
    _deleteAllFilesAction(context, entry),
  ];
}
