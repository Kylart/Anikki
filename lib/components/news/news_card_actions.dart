import 'package:flutter/material.dart';

import 'package:kawanime/components/news/news_actions.dart';
import 'package:kawanime/components/shared/grid_card_action.dart';
import 'package:kawanime/helpers/desktop_hooks.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';

class NewsCardActions extends StatelessWidget {
  const NewsCardActions({super.key, required this.onBack, required this.entry});

  final void Function() onBack;
  final ScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridCardAction(
            icon: Icons.file_download,
            onTap: () {
              showAvailableTorrents(context, entry);
            },
          ),
        ),
        if (isDesktop())
          Expanded(
            child: GridCardAction(
              icon: Icons.edit,
              onTap: () {},
            ),
          ),
        if (!isDesktop())
          GridCardAction(
            icon: Icons.chevron_left,
            onTap: onBack,
          ),
        Expanded(
          child: GridCardAction(
            icon: Icons.more_horiz,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
