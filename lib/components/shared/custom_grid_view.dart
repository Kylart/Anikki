import 'package:flutter/material.dart';
import 'package:kawanime/components/shared/entry_card/entry_card.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';
import 'package:kawanime/providers/local/types/file.dart';

enum GridViewType { local, watchList, news }

class CustomGridView extends StatefulWidget {
  final List<dynamic> entries;
  final GridViewType type;

  const CustomGridView({super.key, required this.entries, required this.type});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
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

          if (widget.type == GridViewType.news) {
            return EntryCard<ScheduleEntry>(
              entry: entry,
              type: CardType.news,
            );
          }

          if (widget.type == GridViewType.local) {
            return EntryCard<LocalFile>(
              entry: entry,
              type: CardType.local,
            );
          }

          return const SizedBox();
        });
  }
}
