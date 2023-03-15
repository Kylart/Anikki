import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/anilist_auth/anilist_menu.dart';
import 'package:anikki/components/search/search.dart';
import 'package:anikki/components/settings/settings.dart';
import 'package:anikki/library/library.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/news/news.dart';
import 'package:anikki/providers/user_preferences/local_directory.dart';
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
          children: const [
            News(),
            Library(),
            Search(),
            WatchList(),
            SettingsPage(),
          ],
        ),
        floatingActionButton: [
          null,
          FloatingActionButton(
            onPressed: () async {
              final localStore = context.read<LocalStore>();
              final preferences = context.read<LocalDirectory>();
              String? path = await FilePicker.platform.getDirectoryPath();

              if (path == null) return;

              preferences.path = path;
              localStore.files = [];
              localStore.getFiles(path);
            },
            child: const Icon(Icons.folder_open_outlined),
          ),
          null,
          FloatingActionButton(
            onPressed: () {},
            child: const AnilistMenu(),
          ),
          null,
        ][currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).indicatorColor,
          // showSelectedLabels: true,
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
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: 'Watch List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
