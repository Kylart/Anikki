import 'package:anikki/components/anilist/anilist_auth.dart';
import 'package:flutter/material.dart';
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
    return PopupMenuButton<AnilistMenuItem>(
      icon: const Icon(
        SimpleIcons.anilist,
        color: Color(0xFF02A9FF),
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<AnilistMenuItem>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Account'),
              Icon(Icons.account_circle),
            ],
          ),
        ),
        const PopupMenuItem<AnilistMenuItem>(
          child: AnilistAuth(),
        ),
        PopupMenuItem<AnilistMenuItem>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Logout',
                style: TextStyle(color: Colors.red),
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
