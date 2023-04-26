import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/features/watch_list/widgets/watch_list_edit.dart';
import 'package:anikki/helpers/show_available_torrents.dart';

List<AnikkiAction> getWatchListActions(BuildContext context,
    Query$GetLists$MediaListCollection$lists$entries entry) {
  return [
    AnikkiAction(
      callback: (context) {
        showAnilistEdit(context, entry);
      },
      icon: Icons.edit_outlined,
      label: 'Edit Watch list entry',
    ),
    AnikkiAction(
      callback: (context) {
        showAvailableTorrents<Query$GetLists$MediaListCollection$lists$entries>(
            context, entry);
      },
      icon: Icons.file_download_outlined,
      label: 'Show torrents',
    ),
    AnikkiAction(
      callback: (context) {
        openInBrowser(entry.media?.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    ),
  ];
}

void showAnilistEdit(BuildContext context,
    Query$GetLists$MediaListCollection$lists$entries entry) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: WatchListEdit(entry: entry),
      );
    },
  );
}
