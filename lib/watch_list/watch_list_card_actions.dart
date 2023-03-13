import 'package:anikki/user_list/user_list_actions.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/news/news_actions.dart';
import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/helpers/desktop_hooks.dart';

class WatchListCardActions extends StatelessWidget {
  const WatchListCardActions(
      {super.key, required this.onBack, required this.entry});

  final void Function() onBack;
  final AnilistListEntry entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: EntryCardAction(
            icon: Icons.file_download,
            onTap: () {
              showAvailableTorrents<AnilistListEntry>(context, entry);
            },
          ),
        ),
        if (isDesktop())
          Expanded(
            child: EntryCardAction(
              icon: Icons.edit,
              onTap: () {
                showAnilistEdit(context, entry);
              },
            ),
          ),
        if (!isDesktop())
          EntryCardAction(
            icon: Icons.chevron_left,
            onTap: onBack,
          ),
        Expanded(
          child: EntryCardAction(
            icon: Icons.open_in_new,
            onTap: () {
              openMediaInBrowser(entry.media.siteUrl);
            },
          ),
        ),
      ],
    );
  }
}
