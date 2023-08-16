import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/view/library_view.dart';
import 'package:anikki/app/settings/settings.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/torrent/torrent.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        if (state is LayoutPortrait) return const SizedBox();

        final settingsBloc =
            BlocProvider.of<SettingsBloc>(context, listen: true);

        void showPage(Widget page) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              child: page,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EntryTag(
                child: Wrap(
                  spacing: 12.0,
                  children: [
                    IconButton(
                      tooltip: 'Library',
                      icon: const Icon(Ionicons.folder_outline),
                      onPressed: () {
                        showPage(
                          const LibraryView(),
                        );
                      },
                    ),
                    IconButton(
                      tooltip: 'Watch Lists',
                      icon: const Icon(Ionicons.library_outline),
                      onPressed: () {
                        showPage(
                          const WatchListView(),
                        );
                      },
                    ),
                    if (settingsBloc.state.settings.torrentType !=
                        TorrentType.none)
                      IconButton(
                        enableFeedback: false,
                        tooltip:
                            settingsBloc.state.settings.torrentType.title(),
                        icon: const Icon(Ionicons.cloud_download_outline),
                        onPressed: () {
                          showPage(
                            const TorrentView(),
                          );
                        },
                      ),
                    IconButton(
                      tooltip: 'Settings',
                      icon: const Icon(Ionicons.settings_outline),
                      onPressed: () {
                        showPage(
                          const SettingsView(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
