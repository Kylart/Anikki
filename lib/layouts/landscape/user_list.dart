import 'package:anikki/layouts/landscape/layout_card.dart';
import 'package:flutter/material.dart';

import 'package:anikki/library/library.dart';
import 'package:anikki/user_list/user_list_app_bar.dart';
import 'package:anikki/watch_list/watch_list.dart';

class UserList extends StatefulWidget {
  const UserList({
    Key? key,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList>
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
                Library(),
                WatchList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
