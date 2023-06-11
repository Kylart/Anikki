import 'dart:io';

import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/anilist_auth/mixins/anilist_auth_is_connected_mixin.dart';
import 'package:anikki/features/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/core/models/user_list_enum.dart';
import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/features/user_list/user_list_refresh.dart';
import 'package:anikki/core/widgets/anikki_action_button.dart';
import 'package:anikki/core/models/anikki_action.dart';
import 'package:anikki/features/user_list/user_list_layout_toggle.dart';

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

class _UserListAppBarState extends State<UserListAppBar>
    with AnilistAuthIsConnectedMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      child: Row(
        children: [
          if (widget.tabController != null && widget.tabs != null)
            Container(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                tabs: widget.tabs!,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                splashBorderRadius: const BorderRadius.all(Radius.circular(40)),
                controller: widget.tabController,
                onTap: (value) => setState(() {
                  currentIndex = value;
                }),
              ),
            ),
          const Spacer(),
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
              child: AnikkiActionButton(
                actions: [
                  AnikkiAction(
                    icon: Icons.folder_open_outlined,
                    label: 'Change folder',
                    callback: (_) => BlocProvider.of<LibraryBloc>(context)
                        .add(const LibraryUpdateRequested()),
                  ),
                  AnikkiAction(
                    icon: Icons.open_in_new,
                    label: Platform.isMacOS
                        ? 'Open in Finder'
                        : 'Open in Explorer',
                    callback: (context) async => openFolderInExplorer(context),
                  ),
                ],
              ),
            ),
          if (currentIndex == 1 && widget.tabController != null && isConnected)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Tooltip(
                message: 'Logout of Anilist',
                child: IconButton(
                  onPressed: () async {
                    BlocProvider.of<AnilistAuthBloc>(context)
                        .add(AnilistAuthLogoutRequested());
                  },
                  icon: const AnikkiIcon(icon: Icons.logout_outlined),
                ),
              ),
            )
        ],
      ),
    );
  }
}
