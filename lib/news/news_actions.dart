import 'dart:io';

import 'package:anikki/watch_list/watch_list_actions.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/helpers/anilist/filters/filters.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/components/entry_action.dart';

List<EntryAction> getNewsActions({
  required BuildContext context,
  required ScheduleEntry entry,
  required AnilistStore store,
}) {
  return [
    EntryAction(
      label: 'Show torrents',
      icon: Icons.file_download_outlined,
      callback: (context) {
        showAvailableTorrents<ScheduleEntry>(context, entry);
      },
    ),
    EntryAction(
      label: 'Show all torrents',
      icon: Icons.cloud_download_outlined,
      callback: (context) {
        showAvailableTorrents<ScheduleEntry>(
          context,
          ScheduleEntry(
            id: entry.id,
            airingAt: entry.airingAt,
            media: entry.media,
          ),
        );
      },
    ),
    entryCardDivider,
    if (store.isConnected && isFollowed(store, entry))
      EntryAction(
        label: 'Edit watch list entry',
        icon: CupertinoIcons.pencil,
        callback: (context) {
          final anilistEntry = [...store.planningList, ...store.currentList]
              .where(
                (element) => element.media.id == entry.media.id,
              )
              .first;

          showAnilistEdit(context, anilistEntry);
        },
      ),
    EntryAction(
      label: 'See on Anilist',
      icon: Platform.isIOS ? CupertinoIcons.arrow_up_right : Icons.open_in_new,
      callback: (context) {
        openInBrowser(entry.media.siteUrl);
      },
    ),
  ];
}
