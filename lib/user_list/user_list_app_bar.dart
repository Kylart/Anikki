import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/settings_button.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/models/settings_action.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/user_preferences/local_directory.dart';
import 'package:anikki/providers/user_preferences/user_list_layout.dart';

class UserListAppBar extends StatefulWidget {
  const UserListAppBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<Tab> tabs;

  @override
  State<UserListAppBar> createState() => _UserListAppBarState();
}

class _UserListAppBarState extends State<UserListAppBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      title: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          tabs: widget.tabs,
          controller: widget.tabController,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleButtons(
            isSelected:
                context.watch<UserListLayout>().layout == UserListLayouts.grid
                    ? [false, true]
                    : [true, false],
            onPressed: (int index) {
              context.read<UserListLayout>().layout =
                  index == 0 ? UserListLayouts.list : UserListLayouts.grid;
            },
            children: const [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            onPressed: () {
              final anilistStore = context.read<AnilistStore>();
              final localStore = context.read<LocalStore>();

              if (widget.tabController.index != 0) {
                anilistStore.refreshWatchLists();
              } else {
                if (localStore.lastPath != null) {
                  localStore.files = [];
                  localStore.getFiles(localStore.lastPath!);
                }
              }
            },
            icon: const Icon(Icons.refresh),
          ),
        ),
        if (currentIndex == 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SettingsButton(
              actions: [
                SettingsAction(
                  icon: Icons.folder_open_outlined,
                  label: 'Change folder',
                  trailing: const SizedBox(),
                  callback: () async {
                    final localStore = context.read<LocalStore>();
                    final preferences = context.read<LocalDirectory>();
                    String? path = await FilePicker.platform.getDirectoryPath();

                    if (path == null) return;

                    preferences.path = path;
                    localStore.files = [];
                    localStore.getFiles(path);
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
