import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/anilist_auth/shared/mixins/anilist_auth_is_connected_mixin.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';
import 'package:anikki/core/models/user_list_enum.dart';

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
          if (widget.type == UserListEnum.watchList) {
            if (isConnected) {
              BlocProvider.of<WatchListBloc>(context).add(
                WatchListRequested(username: auth!.me.name),
              );
            }
          } else {
            final libraryBloc = BlocProvider.of<LibraryBloc>(context);
            libraryBloc
                .add(LibraryUpdateRequested(path: libraryBloc.state.path));
          }
        },
        icon: const AnikkiIcon(icon: Icons.refresh),
      ),
    );
  }
}
