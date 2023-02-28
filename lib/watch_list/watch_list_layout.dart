import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/shared/custom_grid_view.dart';
import 'package:anikki/providers/user_preferences/user_list_layout.dart';
import 'package:anikki/watch_list/watch_list_list_view.dart';

class WatchListLayout extends StatelessWidget {
  const WatchListLayout({super.key, required this.entries});

  final List<AnilistListEntry> entries;

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<UserListLayout>().layout;

    return layout == UserListLayouts.grid
        ? CustomGridView<AnilistListEntry>(
            entries: entries,
          )
        : WatchListListView(entries: entries);
  }
}
