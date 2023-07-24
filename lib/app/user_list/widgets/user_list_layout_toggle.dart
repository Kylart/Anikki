import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';

class UserListLayoutToggle extends StatelessWidget {
  const UserListLayoutToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleButtons(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        isSelected:
            settingsBloc.state.settings.userListLayouts == UserListLayouts.grid
                ? [false, true]
                : [true, false],
        onPressed: (int index) {
          settingsBloc.add(
            SettingsUpdated(
              settingsBloc.state.settings.copyWith(
                userListLayouts:
                    index == 0 ? UserListLayouts.list : UserListLayouts.grid,
              ),
            ),
          );
        },
        children: const [
          AnikkiIcon(icon: Icons.list),
          AnikkiIcon(icon: Icons.grid_view),
        ],
      ),
    );
  }
}
