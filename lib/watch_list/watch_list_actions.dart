import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/entry_action.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/user_list/user_list_actions.dart';

List<EntryAction> getWatchListActions(
    BuildContext context, AnilistListEntry entry) {
  return [
    EntryAction(
      callback: (context) {
        showAnilistEdit(context, entry);
      },
      icon: Icons.edit_outlined,
      label: 'Edit Watch list entry',
    ),
    EntryAction(
      callback: (context) {
        showAvailableTorrents<AnilistListEntry>(context, entry);
      },
      icon: Icons.file_download_outlined,
      label: 'Show torrents',
    ),
    EntryAction(
      callback: (context) {
        openMediaInBrowser(entry.media.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    ),
  ];
}
