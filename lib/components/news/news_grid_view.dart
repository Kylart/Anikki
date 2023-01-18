import 'package:flutter/material.dart';
import 'package:kawanime/components/news/news_grid_card.dart';

import 'package:kawanime/providers/anilist/types/schedule_entry.dart';

class NewsGridView extends StatefulWidget {
  final List<ScheduleEntry> entries;

  const NewsGridView({super.key, required this.entries});

  @override
  State<NewsGridView> createState() => _NewsGridViewState();
}

class _NewsGridViewState extends State<NewsGridView> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: widget.entries.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final entry = widget.entries[index];

          return NewsGridCard(entry: entry);
        });
  }
}
