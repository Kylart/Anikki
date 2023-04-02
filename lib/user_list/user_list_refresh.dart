import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/anilist_auth/mixins/anilist_auth_is_connected_mixin.dart';
import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/models/user_list_enum.dart';

class UserListRefresh extends StatefulWidget {
  const UserListRefresh({
    super.key,
    required this.type,
  });

  final UserListEnum type;

  @override
  State<UserListRefresh> createState() => _UserListRefreshState();
}

class _UserListRefreshState extends State<UserListRefresh>
    with AnilistAuthIsConnectedMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {
          final localStore = context.read<LocalStore>();

          if (widget.type == UserListEnum.watchList) {
            if (isConnected) {
              BlocProvider.of<WatchListBloc>(context).add(
                WatchListRequested(username: auth!.me.name),
              );
            }
          } else {
            if (localStore.lastPath != null) {
              localStore.files = [];
              localStore.getFiles(localStore.lastPath!);
            }
          }
        },
        icon: const AnikkiIcon(icon: Icons.refresh),
      ),
    );
  }
}
