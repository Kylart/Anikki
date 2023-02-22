import 'package:anikki/components/anilist/anilist_auth.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';

enum AnilistMenuItem {
  auth,
  me,
  logout,
}

class AnilistMenu extends StatefulWidget {
  const AnilistMenu({super.key});

  @override
  State<AnilistMenu> createState() => _AnilistMenuState();
}

class _AnilistMenuState extends State<AnilistMenu> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<AnilistStore>();

    return PopupMenuButton<AnilistMenuItem>(
      tooltip: 
        store.isConnected
          ? 'Connected to Anilist as ${store.me!.name}'
          : 'Anilist',
      icon: store.isConnected && store.me?.avatar?.medium != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(store.me!.avatar!.medium!),
            )
          : const Icon(
              SimpleIcons.anilist,
              color: Color(0xFF02A9FF),
            ),
      itemBuilder: (BuildContext context) => [
        if (!store.isConnected)
          const PopupMenuItem<AnilistMenuItem>(
            child: AnilistAuth(),
          ),
        if (store.isConnected)
          PopupMenuItem<AnilistMenuItem>(
            onTap: store.logout,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
