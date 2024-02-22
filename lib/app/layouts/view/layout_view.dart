import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/home/view/home_view.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/layouts/widgets/landscape/layout.dart';
import 'package:anikki/app/layouts/widgets/portrait/layout.dart';
import 'package:anikki/app/library/library.dart';
import 'package:anikki/app/search/view/search_view.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/settings/view/settings_view.dart';
import 'package:anikki/app/torrent/torrent.dart';
import 'package:anikki/core/helpers/connectivity_bloc/connectivity_bloc.dart';
import 'package:anikki/core/models/torrent_type.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            BlocProvider.of<LayoutBloc>(context).add(
              LayoutSizeChanged(constraints),
            );

            final portrait = state is LayoutPortrait;
            final settings =
                BlocProvider.of<SettingsBloc>(context, listen: true)
                    .state
                    .settings;
            final connected =
                BlocProvider.of<ConnectivityBloc>(context, listen: true).state
                    is ConnectivityOnline;
            final watchListState =
                BlocProvider.of<WatchListBloc>(context, listen: true).state;

            final pages = [
              AnikkiPage(
                name: 'Home',
                icon: Ionicons.home_outline,
                selectedIcon: Ionicons.home,
                child: const HomeView(),
              ),
              AnikkiPage(
                name: 'Library',
                icon: Ionicons.folder_outline,
                selectedIcon: Ionicons.folder_open,
                child: const LibraryView(),
              ),
              AnikkiPage(
                name: 'Watch Lists',
                icon: Ionicons.library_outline,
                selectedIcon: Ionicons.library,
                error: watchListState is WatchListError
                    ? watchListState.message
                    : null,
                child: const WatchListView(),
              ),
              if (settings.torrentType != TorrentType.none)
                AnikkiPage(
                  name: settings.torrentType.title,
                  icon: Ionicons.cloud_download_outline,
                  selectedIcon: Ionicons.cloud_download,
                  child: const TorrentView(),
                ),
              if (portrait)
                AnikkiPage(
                  name: 'Search',
                  icon: Ionicons.search_outline,
                  selectedIcon: Ionicons.search,
                  child: const SearchView(),
                ),
              AnikkiPage(
                name: 'Settings',
                icon: Ionicons.settings_outline,
                selectedIcon: Ionicons.settings,
                child: const SettingsView(),
              ),
            ];

            void updatePage(int index) {
              pageController.jumpToPage(index);
            }

            return SafeArea(
              child: Scaffold(
                body: portrait
                    ? PortraitLayout(
                        pageController: pageController,
                        pages: pages,
                        onPageChanged: updatePage,
                        connected: connected,
                      )
                    : LandscapeLayout(
                        pageController: pageController,
                        pages: pages,
                        onPageChanged: updatePage,
                        connected: connected,
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
