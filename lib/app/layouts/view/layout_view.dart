import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/home/home.dart';
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
                icon: HugeIcons.strokeRoundedHome07,
                selectedIcon: HugeIcons.strokeRoundedHome07,
                child: const HomePage(),
              ),
              AnikkiPage(
                name: 'Library',
                icon: HugeIcons.strokeRoundedFolder01,
                selectedIcon: HugeIcons.strokeRoundedFolderLibrary,
                child: const LibraryView(),
              ),
              AnikkiPage(
                name: 'Watch Lists',
                icon: HugeIcons.strokeRoundedCheckList,
                selectedIcon: HugeIcons.strokeRoundedCheckList,
                error: watchListState is WatchListError
                    ? watchListState.message
                    : null,
                child: const WatchListView(),
              ),
              AnikkiPage(
                name: settings.torrentType.title,
                icon: HugeIcons.strokeRoundedCloudDownload,
                child: const TorrentView(),
              ),
              if (portrait)
                AnikkiPage(
                  name: 'Search',
                  icon: HugeIcons.strokeRoundedSearch01,
                  selectedIcon: HugeIcons.strokeRoundedSearch01,
                  child: const SearchView(),
                ),
              AnikkiPage(
                name: 'Settings',
                icon: HugeIcons.strokeRoundedSettings01,
                selectedIcon: HugeIcons.strokeRoundedSettings02,
                child: const SettingsView(),
              ),
            ];

            void updatePage(int index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
              );
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
