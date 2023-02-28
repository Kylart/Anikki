import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/user_preferences/user_list_layout.dart';

class UserListAppBar extends StatefulWidget {
  const UserListAppBar({
    super.key,
    required this.tab,
  });

  final int tab;

  @override
  State<UserListAppBar> createState() => _UserListAppBarState();
}

class _UserListAppBarState extends State<UserListAppBar> {
  final List<bool> isSelected = <bool>[false, true];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleButtons(
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
              });

              context.read<UserListLayout>().layout =
                  isSelected[0] ? UserListLayouts.list : UserListLayouts.grid;
            },
            children: const [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              final anilistStore = context.read<AnilistStore>();

              if (widget.tab != 0) {
                if (anilistStore.isConnected) {
                  anilistStore.getWatchLists();
                }
              }
            },
            icon: const Icon(Icons.refresh),
          ),
        )
      ],
    );
  }
}
