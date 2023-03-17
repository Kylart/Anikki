import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/library/store.dart';
import 'package:anikki/models/user_list_enum.dart';
import 'package:anikki/providers/anilist/anilist.dart';

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
          final anilistStore = context.read<AnilistStore>();
          final localStore = context.read<LocalStore>();

          if (type == UserListEnum.watchList) {
            anilistStore.refreshWatchLists();
          } else {
            if (localStore.lastPath != null) {
              localStore.files = [];
              localStore.getFiles(localStore.lastPath!);
            }
          }
        },
        icon: const AnikkiGlassIcon(icon: Icons.refresh),
      ),
    );
  }
}
