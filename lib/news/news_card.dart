import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/helpers/anilist/filters/is_followed.dart';
import 'package:anikki/helpers/anilist/filters/is_seen.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/news/news_actions.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/user_list/user_list_actions.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.entry});

  final ScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.title() ?? 'N/A';

    final store = context.watch<AnilistStore>();
    bool showBookmark = false;
    bool showDone = false;

    if (store.isConnected) {
      showBookmark = isFollowed(store, entry);

      if (isSeen(store, entry)) {
        showBookmark = false;
        showDone = true;
      }
    }

    if (store.isConnected && store.completedList.isNotEmpty && !showDone) {
      showDone = store.completedList
          .where((e) => e.media.title?.title() == title)
          .toList()
          .isNotEmpty;
    }

    return EntryCard(
      coverImage: coverImage,
      showBookmark: showBookmark,
      showDone: showDone,
      title: title,
      episode: entry.episode?.toString(),
      actions: [
        EntryCardAction(
          label: 'Show torrents',
          icon: Icons.file_download,
          callback: (context) {
            showAvailableTorrents<ScheduleEntry>(context, entry);
          },
        ),
        EntryCardAction(
          label: 'Show all torrents',
          icon: Icons.cloud_download,
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
        if (store.isConnected && isFollowed(store, entry))
          EntryCardAction(
            label: 'Edit watch list entry',
            icon: CupertinoIcons.pencil,
            callback: (context) {
              final anilistEntry = [...store.planningList, ...store.currentList]
                  .where(
                    (element) => element.media.id == entry.media?.id,
                  )
                  .first;

              showAnilistEdit(context, anilistEntry);
            },
          ),
        EntryCardAction(
          label: 'See on Anilist',
          icon: Platform.isIOS ? CupertinoIcons.arrow_up_right : Icons.open_in_new,
          callback: (context) {
            openInBrowser(entry.media?.siteUrl);
          },
        ),
      ],
    );
  }
}
