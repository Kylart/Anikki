import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/models/local_file.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/settings/models/settings.dart';
import 'package:anikki/components/entry_tile.dart';
import 'package:anikki/library/helpers/library_actions.dart';
import 'package:anikki/library/widgets/library_card.dart';
import 'package:anikki/components/custom_list_view.dart';
import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({super.key, required this.entries});

  final List<LocalFile> entries;

  @override
  Widget build(BuildContext context) {
    final layout = BlocProvider.of<SettingsBloc>(context, listen: true)
        .state
        .settings
        .userListLayouts;

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
              tags: entry.media?.genres?.whereType<String>().toList(),
              episode: entry.episode,
            ),
          );
  }
}
