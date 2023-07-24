import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';

class UserListRefresh extends StatefulWidget {
  const UserListRefresh({
    super.key,
    required this.type,
  });

  final UserListEnum type;

  @override
  State<UserListRefresh> createState() => _UserListRefreshState();
}

class _UserListRefreshState extends State<UserListRefresh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {
          if (widget.type == UserListEnum.watchList) {
            final state = BlocProvider.of<AnilistAuthBloc>(context).state;

            if (state is AnilistAuthSuccess) {
              BlocProvider.of<WatchListBloc>(context).add(
                WatchListRequested(username: state.me.name),
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
