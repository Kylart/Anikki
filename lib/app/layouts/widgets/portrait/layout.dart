import 'package:flutter/material.dart';

import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/home/view/home_view.dart';
import 'package:anikki/app/layouts/widgets/portrait/anikki_navigation_bar.dart';
import 'package:anikki/app/library/view/library_page.dart';
import 'package:anikki/app/search/search.dart';
import 'package:anikki/app/settings/settings.dart';

class PortraitLayout extends StatefulWidget {
  const PortraitLayout({
    super.key,
  });

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
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: const [
                HomeView(),
                LibraryPage(),
                WatchListView(),
                SearchView(),
                SettingsView(),
              ],
            ),
            AnikkiNavigationBar(
              index: currentIndex,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
