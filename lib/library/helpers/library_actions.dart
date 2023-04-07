import 'package:flutter/material.dart';

import 'package:anikki/library/repository/repository.dart';
import 'package:anikki/components/entry_action.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/models/local_file.dart';

EntryAction _playAction(BuildContext context, LocalFile entry) => EntryAction(
      callback: (context) {
        playFile(entry, context);
      },
      icon: Icons.play_arrow_outlined,
      label: 'Play episode',
    );

EntryAction _showTorrentsAction(BuildContext context, LocalFile entry) =>
    EntryAction(
      callback: (context) {
        showAvailableTorrents(context, entry);
      },
      icon: Icons.download_outlined,
      label: 'Show torrents',
    );

EntryAction _openBrowserAction(BuildContext context, LocalFile entry) =>
    EntryAction(
      callback: (context) {
        openInBrowser(entry.media?.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    );

EntryAction _deleteFileAction(BuildContext context, LocalFile entry) =>
    EntryAction(
      callback: (context) {
        deleteFile(entry, context);
      },
      icon: Icons.delete_outline,
      label: 'Delete file',
    );

EntryAction _expandAction(
        BuildContext context, LocalFile entry, void Function() onShrink) =>
    EntryAction(
      callback: (context) {
        onShrink();
      },
      icon: Icons.expand_more,
      label: 'Show all episodes',
    );

List<EntryAction> getLibraryActions(BuildContext context, LocalFile entry) {
  return [
    _playAction(context, entry),
    _showTorrentsAction(context, entry),
    _openBrowserAction(context, entry),
    _deleteFileAction(context, entry),
  ];
}

List<EntryAction> geExpandabletLibraryActions({
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
  ];
}
