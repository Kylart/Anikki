import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/list_view_divider.dart';
import 'package:anikki/components/entry_tile.dart';

class CustomListView<T extends HasAnilistMedia> extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.entries,
    required this.getSubtitle,
  });

  final List<T> entries;
  final Widget Function(T entry) getSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(4.0),
      itemCount: entries.length,
      separatorBuilder: (context, index) => const ListViewDivider(),
      itemBuilder: (context, index) {
        final entry = entries[index];

        return EntryTile(
          entry: entry,
          subtitle: getSubtitle(entry),
        );
      },
    );
  }
}
