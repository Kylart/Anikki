import 'package:flutter/material.dart';

import 'package:anikki/components/entry_action.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/user_list/user_list_actions.dart';

List<EntryAction> getLibraryActions(BuildContext context, LocalFile entry) {
  return [
    EntryAction(
      callback: (context) {
        playFile(entry, context);
      },
      icon: Icons.play_arrow_outlined,
      label: 'Play file',
    ),
    EntryAction(
      callback: (context) {
        download<LocalFile>(context, entry);
      },
      icon: Icons.download_outlined,
      label: 'Show torrents',
    ),
    EntryAction(
      callback: (context) {
        openMediaInBrowser(entry.media.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    ),
    EntryAction(
      callback: (context) {
        deleteFile(entry, context);
      },
      icon: Icons.delete_outline,
      label: 'Delete file',
    ),
  ];
}
