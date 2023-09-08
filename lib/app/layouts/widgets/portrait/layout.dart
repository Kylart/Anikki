import 'package:anikki/app/home/view/home_view.dart';
import 'package:anikki/app/library/view/library_page.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/anilist_watch_list/watch_list.dart';
import 'package:anikki/app/layouts/widgets/portrait/anikki_navigation_bar.dart';
import 'package:anikki/app/search/search.dart';
import 'package:anikki/app/settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          children: const [
            HomeView(),
            LibraryPage(),
            WatchListView(),
            SearchView(),
            SettingsView(),
          ],
        ),
        floatingActionButton: [
          null,
          FloatingActionButton(
            onPressed: () async => BlocProvider.of<LibraryBloc>(context)
                .add(const LibraryUpdateRequested()),
            child: const Icon(Icons.folder_open_outlined),
          ),
          null,
          null,
          null,
        ][currentIndex],
        bottomNavigationBar: AnikkiNavigationBar(
          index: currentIndex,
          pageController: pageController,
        ),
      ),
    );
  }
}
