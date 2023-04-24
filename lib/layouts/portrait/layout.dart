import 'package:flutter/material.dart';

import 'package:anikki/watch_list/watch_list.dart';
import 'package:anikki/library/repository/repository.dart';
import 'package:anikki/layouts/portrait/anikki_navigation_bar.dart';
import 'package:anikki/search/search.dart';
import 'package:anikki/settings/settings.dart';
import 'package:anikki/library/library.dart';
import 'package:anikki/models/user_list_enum.dart';
import 'package:anikki/news/news.dart';
import 'package:anikki/user_list/user_list_app_bar.dart';

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
          backgroundColor: Colors.transparent,
          body: PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              const NewsPage(
                showOutline: false,
              ),
              Column(
                children: const [
                  UserListAppBar(
                    userListType: UserListEnum.local,
                  ),
                  Expanded(
                    child: LibraryView(),
                  ),
                ],
              ),
              Column(
                children: const [
                  UserListAppBar(
                    userListType: UserListEnum.watchList,
                  ),
                  Expanded(child: WatchListView()),
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
            null,
            null,
            null,
          ][currentIndex],
          bottomNavigationBar: AnikkiNavigationBar(
            index: currentIndex,
            pageController: pageController,
          )),
    );
  }
}
