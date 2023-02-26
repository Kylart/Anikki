import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/news/news_actions.dart';
import 'package:anikki/components/shared/entry_card/entry_card_action.dart';
import 'package:anikki/helpers/desktop_hooks.dart';

class WatchListCardActions extends StatelessWidget {
  const WatchListCardActions({super.key, required this.onBack, required this.entry});

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
              onTap: () {},
            ),
          ),
        if (!isDesktop())
          EntryCardAction(
            icon: Icons.chevron_left,
            onTap: onBack,
          ),
      ],
    );
  }
}
