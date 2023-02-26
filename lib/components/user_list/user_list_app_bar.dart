import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/local/local.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListAppBar extends StatefulWidget {
  const UserListAppBar({
    super.key,
    required this.onLayoutChange,
    required this.tab,
  });

  final void Function(String layout) onLayoutChange;
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

              widget.onLayoutChange(isSelected[0] == true ? 'list' : 'grid');
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
              final localStore = context.read<LocalStore>();

              if (widget.tab == 0) {
                if (localStore.currentPath != null) {
                  localStore.retrieveFilesFromCurrentPath();
                }
              } else {
                if (anilistStore.isConnected) {
                  anilistStore.getWatchLists(anilistStore.me!.name);
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
