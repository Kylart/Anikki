import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/news/news_actions.dart';
import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/helpers/desktop_hooks.dart';

class NewsCardActions extends StatelessWidget {
  const NewsCardActions({super.key, required this.onBack, required this.entry});

  final void Function() onBack;
  final ScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: EntryCardAction(
            icon: Icons.file_download,
            onTap: () {
              showAvailableTorrents<ScheduleEntry>(context, entry);
            },
          ),
        ),
        if (isDesktop())
          Expanded(
            child: EntryCardAction(
              icon: Icons.cloud_download,
              onTap: () {
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
              openInBrowser(entry.media?.siteUrl);
            },
          ),
        ),
      ],
    );
  }
}
