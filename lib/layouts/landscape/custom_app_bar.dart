import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:anikki/anilist_auth/anilist_auth.dart';
import 'package:anikki/components/search/search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTap() {
      showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            alignment: Alignment.topCenter,
            child: Search(),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const IgnorePointer(
            child: Opacity(
              opacity: 0.0,
              child: AnilistAuthPage(),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 500,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: TextField(
                mouseCursor: SystemMouseCursors.click,
                onTap: onTap,
                showCursor: false,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  filled: false,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  hintText: 'Search anything',
                ),
              ),
            ),
          ),
          const Spacer(),
          const AnilistAuthPage(),
        ],
      ),
    );
  }
}
