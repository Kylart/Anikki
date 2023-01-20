import 'package:flutter/material.dart';
import 'package:kawanime/components/user_list/user_list_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kawanime/layouts/landscape/library.dart';
import 'package:kawanime/providers/local/local.dart';
import 'package:provider/provider.dart';

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline;

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final store = context.read<LocalStore>();
                        String? path =
                            await FilePicker.platform.getDirectoryPath();

                        if (path == null) return;

                        await store.setCurrentPath(path);
                      },
                      child: const Text('Choose Folder'),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: outlineColor,
              height: 1,
            ),
            if (tabIndex == 0) Library(layout: layout),
          ],
        ),
      ),
    );
  }
}
