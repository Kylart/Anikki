import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/models/library_entry.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/settings/models/settings.dart';
import 'package:anikki/widgets/entry/entry_tile.dart';
import 'package:anikki/features/library/widgets/library_card.dart';
import 'package:anikki/widgets/list_view/custom_list_view.dart';
import 'package:anikki/widgets/grid_view/custom_grid_view.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({
    super.key,
    required this.entries,
  });

  final List<LibraryEntry> entries;

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
            builder: (entry, index) {
              return LibraryCard(
                entry: entry,
              );
            },
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) {
              return EntryTile(
                media: entry.media == null
                    ? Fragment$shortMedia(id: 0)
                    : entry.media!,
                subtitle: entry.entries.length == 1
                    ? Text(
                        'Episode ${entry.entries.first.episode ?? 'not specified'}',
                      )
                    : Text(
                        'Episode ${entry.epMin} to ${entry.epMax}',
                      ),
              );
            },
          );
  }
}
