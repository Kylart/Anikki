import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/settings/domain/models/models.dart';
import 'package:anikki/core/widgets/entry/entry_tile.dart';
import 'package:anikki/features/anilist_watch_list/presentation/widgets/watch_list_card.dart';
import 'package:anikki/core/widgets/list_view/custom_list_view.dart';
import 'package:anikki/core/widgets/grid_view/custom_grid_view.dart';
import 'package:anikki/features/user_list/shared/user_list_grid_delegate.dart';

class WatchListLayout extends StatelessWidget {
  const WatchListLayout({super.key, required this.entries});

  final List<Query$GetLists$MediaListCollection$lists$entries> entries;

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
            builder: (entry, index) => WatchListCard(
              entry: entry,
              heroTag: 'list-${entry.media?.id}',
            ),
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) => EntryTile(
              media: Media(anilistInfo: entry.media!),
              heroTag: 'list-${entry.media?.id}',
              subtitle: entry.status == Enum$MediaListStatus.CURRENT &&
                      entry.progress != null
                  ? Text('Currently at episode ${entry.progress!.toString()}')
                  : (entry.status != Enum$MediaListStatus.CURRENT &&
                          entry.notes != null)
                      ? Text(entry.notes!)
                      : const SizedBox(),
            ),
          );
  }
}
