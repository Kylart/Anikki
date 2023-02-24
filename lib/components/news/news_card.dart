import 'package:flutter/material.dart';

import 'package:anikki/components/news/news_card_actions.dart';
import 'package:anikki/components/shared/entry_card/entry_card.dart';
import 'package:anikki/components/shared/entry_card/entry_card_background.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.entry});

  final ScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.title() ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: EntryCardBackground(
        title: title,
        episode: entry.episode?.toString(),
      ),
      actions: NewsCardActions(
        entry: entry,
        onBack: () {},
      ),
    );
  }
}