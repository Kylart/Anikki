import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/library/view/library_view.dart';
import 'package:anikki/app/settings/settings.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/torrent/torrent.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class Page extends Equatable {
  const Page({
    required this.widget,
    required this.name,
    required this.icon,
  });

  final Widget widget;
  final String name;
  final IconData icon;

  @override
  List<Object?> get props => [
        widget,
        name,
        icon,
      ];
}

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
    this.pageController,
    this.index,
  });

  final PageController? pageController;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final portrait = BlocProvider.of<LayoutBloc>(context, listen: true).state
        is LayoutPortrait;
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);
    final connectivityBloc =
        BlocProvider.of<ConnectivityBloc>(context, listen: true);

    final pages = [
      if (portrait)
        const Page(
          widget: SizedBox(),
          name: 'Home',
          icon: Ionicons.home_outline,
        ),
      const Page(
        widget: LibraryView(),
        name: 'Library',
        icon: Ionicons.folder_outline,
      ),
      const Page(
        widget: WatchListView(),
        name: 'Watch Lists',
        icon: Ionicons.library_outline,
      ),
      if (!portrait &&
          settingsBloc.state.settings.torrentType != TorrentType.none)
        Page(
          widget: const TorrentView(),
          name: settingsBloc.state.settings.torrentType.title(),
          icon: Ionicons.cloud_download_outline,
        ),
      if (portrait)
        const Page(
          widget: SizedBox(),
          name: 'Search',
          icon: Ionicons.search_outline,
        ),
      const Page(
        widget: SettingsView(),
        name: 'Settings',
        icon: Ionicons.settings_outline,
      ),
    ];

    final currentPage = index == null ? null : pages.elementAt(index!);

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
            child: page.widget,
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
                  IconButton(
                    tooltip: page.name,
                    icon: Icon(page.icon),
                    onPressed: () => showPage(page.name),
                    color: page == currentPage
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                if (connectivityBloc.state is ConnectivityOffline)
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const Dialog(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          child: LayoutCard(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Cannot connect to the Internet.\n\nAnikki will reconnect automatically whenever possible.',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                        ),
                      );
                    },
                    tooltip: 'No internet connection',
                    icon: Icon(
                      Ionicons.warning_outline,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
