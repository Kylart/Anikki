import 'package:flutter/material.dart';

import 'package:anikki/components/anilist_auth/anilist_menu.dart';
import 'package:anikki/components/search/search.dart';
import 'package:anikki/components/settings/settings.dart';
import 'package:anikki/library/library.dart';
import 'package:anikki/models/user_list_enum.dart';
import 'package:anikki/news/news.dart';
import 'package:anikki/user_list/user_list_actions.dart';
import 'package:anikki/user_list/user_list_app_bar.dart';
import 'package:anikki/watch_list/watch_list.dart';

class PortraitLayout extends StatefulWidget {
  const PortraitLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<PortraitLayout> createState() => _PortraitLayoutState();
}

class _PortraitLayoutState extends State<PortraitLayout> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: [
            const News(
              showOutline: false,
            ),
            Column(
              children: const [
                UserListAppBar(
                  userListType: UserListEnum.local,
                ),
                Expanded(child: Library()),
              ],
            ),
            Column(
              children: const [
                UserListAppBar(
                  userListType: UserListEnum.local,
                ),
                Expanded(child: WatchList()),
              ],
            ),
            const Search(),
            const SettingsPage(),
          ],
        ),
        floatingActionButton: [
          null,
          FloatingActionButton(
            onPressed: () async => updateFolderPath(context),
            child: const Icon(Icons.folder_open_outlined),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const AnilistMenu(),
          ),
          null,
          null,
        ][currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).indicatorColor,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            pageController.jumpToPage(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases_outlined),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              label: 'Local',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: 'Watch List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
