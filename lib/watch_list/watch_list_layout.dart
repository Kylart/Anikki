import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/custom_list_view.dart';
import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/providers/user_preferences/user_list_layout.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class WatchListLayout extends StatelessWidget {
  const WatchListLayout({super.key, required this.entries});

  final List<AnilistListEntry> entries;

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<UserListLayout>().layout;

    return layout == UserListLayouts.grid
        ? CustomGridView<AnilistListEntry>(
            entries: entries,
            gridDelegate: userListGridDelegate,
          )
        : CustomListView(
            entries: entries,
            getSubtitle: (entry) {
              return entry.status == AnilistMediaListStatus.current &&
                      entry.progress != null
                  ? Text('Currently at episode ${entry.progress!.toString()}')
                  : (entry.status != AnilistMediaListStatus.current &&
                          entry.notes != null)
                      ? Text(entry.notes!)
                      : const SizedBox();
            },
          );
  }
}
