import 'package:anikki/library/library.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/user_list/user_list_app_bar.dart';
import 'package:anikki/layouts/landscape/watch_list.dart';
import 'package:anikki/providers/user_preferences.dart';

class UserList extends StatefulWidget {
  const UserList({
    Key? key,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList>
    with SingleTickerProviderStateMixin {
  String layout = 'grid';
  String currentPath = '';

  int tabIndex = 0;
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Library'),
    Tab(text: 'Watch Lists'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);

    final preferences = context.read<UserPreferences>();
    currentPath = preferences.localDirectory ?? '';
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline.withOpacity(0.5);

    return Flexible(
      flex: 2,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: outlineColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            UserListAppBar(
              tab: _tabController.index,
              onLayoutChange: (String l) {
                setState(() {
                  layout = l;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).primaryColor,
                    onTap: (value) {
                      setState(() {
                        tabIndex = value;
                      });
                    },
                    tabs: tabs,
                    controller: _tabController,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: tabIndex == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              final preferences =
                                  context.read<UserPreferences>();
                              String? path =
                                  await FilePicker.platform.getDirectoryPath();

                              if (path == null) return;

                              preferences.localDirectory = path;

                              setState(() {
                                currentPath = path;
                              });
                            },
                            child: const Text('Choose Folder'),
                          ),
                        )
                      : const SizedBox(),
                )
              ],
            ),
            Divider(
              color: outlineColor,
              height: 1,
            ),
            if (tabIndex == 0)
              Library(
                layout: layout,
                path: currentPath,
              ),
            if (tabIndex == 1) WatchList(layout: layout)
          ],
        ),
      ),
    );
  }
}
