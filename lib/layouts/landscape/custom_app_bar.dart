import 'package:flutter/material.dart';

import 'package:anikki/helpers/connectivity_bloc/is_online_mixin.dart';
import 'package:anikki/features/search/search.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with IsOnlineMixin {
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
        children: [
          const Spacer(),
          SizedBox(
            width: 500,
            child: TextField(
              mouseCursor: SystemMouseCursors.click,
              onTap: onTap,
              showCursor: false,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                filled: false,
                fillColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                hintText: 'Search anything',
              ),
            ),
          ),
          const Spacer(),
          Offstage(
            offstage: isOnline,
            child: const Tooltip(
              message:
                  'No internet connection detected. Some features will not work.',
              child: Icon(Icons.signal_wifi_connected_no_internet_4),
            ),
          ),
        ],
      ),
    );
  }
}
