import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/models/local_file.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/settings/models/settings.dart';
import 'package:anikki/components/entry_tile.dart';
import 'package:anikki/library/helpers/library_actions.dart';
import 'package:anikki/library/widgets/library_card.dart';
import 'package:anikki/components/custom_list_view.dart';
import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class LibraryLayout extends StatefulWidget {
  const LibraryLayout({super.key, required this.entries});

  final List<LibraryEntry> entries;

  @override
  State<LibraryLayout> createState() => _LibraryLayoutState();
}

class _LibraryLayoutState extends State<LibraryLayout> {
  List<bool> isExpanded = [];

  @override
  void initState() {
    super.initState();
    isExpanded = widget.entries.map((e) => e.entries.length == 1).toList();
  }

  List<LocalFile> get entries {
    List<LocalFile> result = [];

    for (int index = 0; index < widget.entries.length; index++) {
      if (isExpanded.elementAt(index)) {
        result.addAll(widget.entries.elementAt(index).entries);
      } else {
        result.add(widget.entries.elementAt(index).entries.last);
      }
    }

    return result;
  }

  int indexOf(LocalFile file) {
    return widget.entries.indexWhere(
      (element) => element.entries.contains(file),
    );
  }

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
              final entryIndex = indexOf(entry);
              final libraryEntry = widget.entries.elementAt(entryIndex);

              return LibraryCard(
                onTap: () {
                  /// Find index of the file in entries
                  final index = entryIndex;

                  setState(() {
                    isExpanded[index] = !isExpanded[index];
                  });
                },
                entry: entry,
                episode: libraryEntry.entries.length == 1 || isExpanded[entryIndex]
                    ? libraryEntry.entries.firstWhere((element) => element == entry).episode
                    : '${libraryEntry.epMin} ~ ${libraryEntry.epMax}',
                isExpandable:
                    libraryEntry.entries.length > 1 && !isExpanded[entryIndex],
              );
            },
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) {
              final entryIndex = indexOf(entry);
              final libraryEntry = widget.entries.elementAt(entryIndex);

              return EntryTile(
                entry: entry,
                subtitle: libraryEntry.entries.length == 1
                    ? Text('Episode ${libraryEntry.entries.firstWhere((element) => element == entry).episode ?? 'not specified'}')
                    : Text('Episode ${libraryEntry.epMin} to ${libraryEntry.epMax}'),
                actions: getLibraryActions(context, entry),
                title:
                    entry.title ?? entry.media?.title?.userPreferred ?? 'N/A',
                coverImage: entry.media?.coverImage?.extraLarge ??
                    entry.media?.coverImage?.large ??
                    entry.media?.coverImage?.medium,
                bannerImage: entry.media?.bannerImage,
                tags: entry.media?.genres?.whereType<String>().toList(),
                episode: entry.episode,
              );
            },
          );
  }
}
