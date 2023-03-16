import 'package:anikki/models/user_list_enum.dart';
import 'package:anikki/user_list/user_list_actions.dart';
import 'package:anikki/user_list/user_list_refresh.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/settings_button.dart';
import 'package:anikki/models/settings_action.dart';
import 'package:anikki/user_list/user_list_layout_toggle.dart';

class UserListAppBar extends StatefulWidget {
  const UserListAppBar({
    super.key,
    this.tabController,
    this.tabs,
    this.userListType,
  });

  final TabController? tabController;
  final List<Tab>? tabs;
  final UserListEnum? userListType;

  @override
  State<UserListAppBar> createState() => _UserListAppBarState();
}

class _UserListAppBarState extends State<UserListAppBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      title: widget.tabController != null && widget.tabs != null
          ? Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                tabs: widget.tabs!,
                controller: widget.tabController,
                onTap: (value) => setState(() {
                  currentIndex = value;
                }),
              ),
            )
          : null,
      actions: [
        const UserListLayoutToggle(),
        if (widget.tabController != null)
          UserListRefresh(
            type: widget.tabController?.index == 0
                ? UserListEnum.local
                : UserListEnum.watchList,
          ),
        if (widget.userListType != null)
          UserListRefresh(
            type: widget.userListType!,
          ),
        if (currentIndex == 0 && widget.tabController != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SettingsButton(
              actions: [
                SettingsAction(
                  icon: Icons.folder_open_outlined,
                  label: 'Change folder',
                  trailing: const SizedBox(),
                  callback: () async => updateFolderPath(context),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
