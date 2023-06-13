import 'package:flutter/material.dart';

import 'package:anikki/features/watch_list/watch_list.dart';
import 'package:anikki/features/library/library.dart';
import 'package:anikki/features/layouts/landscape/layout_card.dart';
import 'package:anikki/features/user_list/presentation/widgets/user_list_app_bar.dart';

class UserListView extends StatefulWidget {
  const UserListView({
    Key? key,
  }) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> tabs = const <Tab>[
    Tab(text: 'Library'),
    Tab(text: 'Watch Lists'),
  ];

  final borderRadius = const BorderRadius.all(Radius.circular(20));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserListAppBar(
            tabController: _tabController,
            tabs: tabs,
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LibraryView(),
                WatchListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
