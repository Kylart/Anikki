import 'package:flutter/material.dart';

import 'package:anikki/components/anilist_auth/anilist_menu.dart';
import 'package:anikki/components/search/search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Dialog(
                  alignment: Alignment.topCenter,
                  child: Search(),
                );
              },
            );
          },
          icon: const Icon(
            Icons.search,
            size: 30.0,
          ),
        ),
        const AnilistMenu(),
      ],
    );
  }
}
