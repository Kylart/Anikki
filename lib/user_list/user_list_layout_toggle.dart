import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/providers/user_preferences/user_list_layout.dart';

class UserListLayoutToggle extends StatelessWidget {
  const UserListLayoutToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleButtons(
        isSelected:
            context.watch<UserListLayout>().layout == UserListLayouts.grid
                ? [false, true]
                : [true, false],
        onPressed: (int index) {
          context.read<UserListLayout>().layout =
              index == 0 ? UserListLayouts.list : UserListLayouts.grid;
        },
        children: const [
          Icon(Icons.list),
          Icon(Icons.grid_view),
        ],
      ),
    );
  }
}
