import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/entry_tile.dart';
import 'package:anikki/library/library_actions.dart';
import 'package:anikki/library/library_card.dart';
import 'package:anikki/components/custom_list_view.dart';
import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/providers/user_preferences/user_list_layout.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<UserListLayout>().layout;
    final entries = context.watch<LocalStore>().files;

    return layout == UserListLayouts.grid
        ? CustomGridView(
            entries: entries,
            gridDelegate: userListGridDelegate,
            builder: (entry) => LibraryCard(entry: entry),
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) => EntryTile(
              entry: entry,
              subtitle: Text(
                'Episode ${entry.episode}',
              ),
              actions: getLibraryActions(context, entry),
              title: entry.title ?? entry.media?.title?.userPreferred ?? 'N/A',
              coverImage: entry.media?.coverImage?.extraLarge ??
                  entry.media?.coverImage?.large ??
                  entry.media?.coverImage?.medium,
              bannerImage: entry.media?.bannerImage,
              tags: entry.media?.genres
                  ?.whereType<String>()
                  .toList(),
              episode: entry.episode,
            ),
          );
  }
}
