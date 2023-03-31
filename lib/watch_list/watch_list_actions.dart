import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/watch_list/watch_list_edit.dart';
import 'package:anikki/components/entry_action.dart';
import 'package:anikki/helpers/show_available_torrents.dart';

List<EntryAction> getWatchListActions(
    BuildContext context, Query$GetLists$MediaListCollection$lists$entries entry) {
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
        showAvailableTorrents<Query$GetLists$MediaListCollection$lists$entries>(context, entry);
      },
      icon: Icons.file_download_outlined,
      label: 'Show torrents',
    ),
    EntryAction(
      callback: (context) {
        openInBrowser(entry.media?.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    ),
  ];
}

void showAnilistEdit(BuildContext context, Query$GetLists$MediaListCollection$lists$entries entry) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: WatchListEdit(entry: entry),
      );
    },
  );
}
