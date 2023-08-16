import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/view/library_view.dart';
import 'package:anikki/app/settings/settings.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/torrent/torrent.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/fade_overlay.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        if (state is LayoutPortrait) return const SizedBox();

        void showPage(String name, Widget page) {
          Navigator.of(context).push(
            FadeOverlay(
              child: Column(
                children: [
                  AppBar(
                    title: Text(name),
                  ),
                  Expanded(
                    child: page,
                  ),
                ],
              ),
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
                          'Library',
                          const LibraryView(),
                        );
                      },
                    ),
                    BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
                      builder: (context, state) {
                        if (state is! AnilistAuthSuccess) {
                          return const SizedBox();
                        }

                        return IconButton(
                          tooltip: 'Watch Lists',
                          icon: const Icon(Ionicons.library_outline),
                          onPressed: () {
                            showPage(
                              'Watch Lists',
                              const WatchListView(),
                            );
                          },
                        );
                      },
                    ),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        final settings = state.settings;
                        final enabled =
                            settings.torrentType != TorrentType.none;
                        final name = enabled
                            ? settings.torrentType.title()
                            : 'Torrent features are disabled. Enable it in your settings!';

                        return IconButton(
                          enableFeedback: false,
                          tooltip: name,
                          icon: const Icon(Ionicons.cloud_download_outline),
                          onPressed: () {
                            if (!enabled) return;

                            showPage(
                              name,
                              const TorrentView(),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      tooltip: 'Settings',
                      icon: const Icon(Ionicons.settings_outline),
                      onPressed: () {
                        showPage(
                          'Settings',
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
