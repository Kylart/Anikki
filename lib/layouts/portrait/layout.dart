import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/watch_list/watch_list.dart';
import 'package:anikki/layouts/portrait/anikki_navigation_bar.dart';
import 'package:anikki/features/search/search.dart';
import 'package:anikki/features/settings/settings.dart';
import 'package:anikki/features/library/library.dart';
import 'package:anikki/models/user_list_enum.dart';
import 'package:anikki/features/news/news.dart';
import 'package:anikki/user_list/user_list_app_bar.dart';
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
              NewsPage(
                showOutline: false,
              ),
              Column(
                children: [
                  UserListAppBar(
                    userListType: UserListEnum.local,
                  ),
                  Expanded(
                    child: LibraryView(),
                  ),
                ],
              ),
              Column(
                children: [
                  UserListAppBar(
                    userListType: UserListEnum.watchList,
                  ),
                  Expanded(child: WatchListView()),
                ],
              ),
              SearchPage(),
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
          )),
    );
  }
}
