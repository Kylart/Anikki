import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_media.dart';
import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/settings/models/settings.dart';
import 'package:anikki/widgets/entry/entry_tile.dart';
import 'package:anikki/features/library/helpers/library_actions.dart';
import 'package:anikki/features/library/widgets/library_card.dart';
import 'package:anikki/widgets/list_view/custom_list_view.dart';
import 'package:anikki/widgets/grid_view/custom_grid_view.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({
    super.key,
    required this.entries,
    required this.isExpanded,
  });

  final List<LibraryEntry> entries;
  final List<bool> isExpanded;

  List<LocalFile> get expandedEntries {
    List<LocalFile> result = [];

    for (int index = 0; index < entries.length; index++) {
      if (isExpanded.elementAt(index)) {
        if (entries.elementAt(index).entries.length > 1) {
          result.add(LocalFile(path: 'shrink/$index', file: File('')));
        }
        result.addAll(entries.elementAt(index).entries);
      } else {
        result.add(entries.elementAt(index).entries.last);
      }
    }

    return result;
  }

  int indexOf(LocalFile file) {
    return entries.indexWhere(
      (element) => element.entries.contains(file),
    );
  }

  void toggleExpanded(BuildContext context, int index) {
    BlocProvider.of<LibraryBloc>(context).add(
      LibraryEntryExpanded(index: index),
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
            entries: expandedEntries,
            gridDelegate: userListGridDelegate,
            builder: (entry, index) {
              final entryIndex = indexOf(entry);
              final libraryEntry = entries.elementAt(entryIndex);

              return LibraryCard(
                onTap: () => toggleExpanded(context, entryIndex),
                entry: libraryEntry,
                episode:
                    libraryEntry.entries.length == 1 || isExpanded[entryIndex]
                        ? libraryEntry.entries
                            .firstWhere((element) => element == entry)
                            .episode
                            ?.toString()
                        : '${libraryEntry.epMin} ~ ${libraryEntry.epMax}',
                isExpandable:
                    libraryEntry.entries.length > 1 && !isExpanded[entryIndex],
              );
            },
          )
        : CustomListView(
            entries: expandedEntries,
            builder: (context, entry) {
              final isShrinkEntry = entry.path.startsWith('shrink/');

              if (isShrinkEntry) {
                return ListTile(
                  dense: true,
                  trailing: IconButton(
                    onPressed: () {
                      toggleExpanded(
                          context, int.tryParse(entry.path.split('/')[1])!);
                    },
                    icon: const Icon(Icons.expand_less),
                  ),
                );
              } else {
                final entryIndex = indexOf(entry);
                final libraryEntry = entries.elementAt(entryIndex);
                final isExpandable =
                    libraryEntry.entries.length > 1 && !isExpanded[entryIndex];

                return EntryTile(
                  entry: entry,
                  overlayWidget: EntryCardOverlayMedia(
                    isLibrary: true,
                    media: entry.media,
                    entry: libraryEntry,
                    fallbackEpisodeNumber: libraryEntry.epMax ?? 0,
                  ),
                  subtitle:
                      libraryEntry.entries.length == 1 || isExpanded[entryIndex]
                          ? Text(
                              'Episode ${libraryEntry.entries.firstWhere((element) => element == entry).episode ?? 'not specified'}',
                            )
                          : Text(
                              'Episode ${libraryEntry.epMin} to ${libraryEntry.epMax}',
                            ),
                  actions: isExpandable
                      ? geExpandabletLibraryActions(
                          context: context,
                          entry: entry,
                          onShrink: () => toggleExpanded(context, entryIndex),
                        )
                      : getLibraryActions(context, entry),
                  title:
                      entry.title ?? entry.media?.title?.userPreferred ?? 'N/A',
                  coverImage: entry.media?.coverImage?.extraLarge ??
                      entry.media?.coverImage?.large ??
                      entry.media?.coverImage?.medium,
                  bannerImage: entry.media?.bannerImage,
                  tags: entry.media?.genres?.whereType<String>().toList(),
                  episode: entry.episode?.toString(),
                );
              }
            },
          );
  }
}
