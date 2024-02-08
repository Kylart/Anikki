import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/home/shared/widgets/not_connected_icon.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/view/library_view.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/settings/settings.dart';
import 'package:anikki/app/torrent/torrent.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class _Page extends Equatable {
  const _Page({
    required this.child,
    required this.name,
    required this.icon,
    this.error,
  });

  final Widget child;
  final String name;
  final IconData icon;
  final String? error;

  @override
  List<Object?> get props => [
        child,
        name,
        icon,
        error,
      ];
}

class CustomMenu extends StatelessWidget {
  CustomMenu({
    super.key,
    this.pageController,
    this.index,
  }) {
    if (pageController != null) assert(index != null);
    if (index != null) assert(pageController != null);
  }

  final PageController? pageController;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final portrait = BlocProvider.of<LayoutBloc>(context, listen: true).state
        is LayoutPortrait;
    final settings =
        BlocProvider.of<SettingsBloc>(context, listen: true).state.settings;
    final connected = BlocProvider.of<ConnectivityBloc>(context, listen: true)
        .state is ConnectivityOnline;
    final watchListState =
        BlocProvider.of<WatchListBloc>(context, listen: true).state;

    final pages = [
      if (portrait)
        const _Page(
          child: SizedBox(),
          name: 'Home',
          icon: Ionicons.home_outline,
        ),
      const _Page(
        child: LibraryView(),
        name: 'Library',
        icon: Ionicons.folder_outline,
      ),
      _Page(
        child: const WatchListView(),
        name: 'Watch Lists',
        icon: Ionicons.library_outline,
        error: watchListState is WatchListError ? watchListState.message : null,
      ),
      if (settings.torrentType != TorrentType.none)
        _Page(
          child: const TorrentView(),
          name: settings.torrentType.title,
          icon: Ionicons.cloud_download_outline,
        ),
      if (portrait)
        const _Page(
          child: SizedBox(),
          name: 'Search',
          icon: Ionicons.search_outline,
        ),
      const _Page(
        child: SettingsView(),
        name: 'Settings',
        icon: Ionicons.settings_outline,
      ),
    ];

    void showPage(String name) {
      final pageIndex = pages.indexWhere((p) => p.name == name);
      final page = pages.elementAt(pageIndex);

      if (pageController != null) {
        pageController?.jumpToPage(pageIndex);
      } else {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: page.child,
          ),
        );
      }
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
                for (final page in pages)
                  Badge(
                    isLabelVisible: page.error != null,
                    label: const Icon(
                      Ionicons.warning_outline,
                      size: 8,
                    ),
                    child: IconButton(
                      tooltip: page.error ?? page.name,
                      icon: Icon(page.icon),
                      onPressed: () => showPage(page.name),
                      color: index != null && page == pages.elementAt(index!)
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                if (!connected) const NotConnectedIcon()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
