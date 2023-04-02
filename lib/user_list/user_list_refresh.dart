import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/library/store.dart';
import 'package:anikki/models/user_list_enum.dart';

class UserListRefresh extends StatelessWidget {
  const UserListRefresh({
    super.key,
    required this.type,
  });

  final UserListEnum type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {
          final auth = BlocProvider.of<AnilistAuthBloc>(context);
          final localStore = context.read<LocalStore>();

          if (type == UserListEnum.watchList) {
            if (auth.isConnected) {
              context.read<WatchListBloc>().add(
                    WatchListRequested(
                        username: (auth.state as AnilistAuthSuccess).me.name),
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
