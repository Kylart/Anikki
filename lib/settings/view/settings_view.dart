import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/widgets/anikki_icon.dart';
import 'package:anikki/helpers/capitalize.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);

    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('General'),
          tiles: <SettingsTile>[
            /// Theme
            SettingsTile(
              leading: const Icon(Icons.format_paint),
              title: const Text('Theme'),
              trailing: DropdownButton(
                value: settingsBloc.state.settings.theme,
                items: ThemeMode.values
                    .map((mode) => DropdownMenuItem(
                          value: mode,
                          child: Text(mode.name.capitalize()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;

                  settingsBloc.add(
                    SettingsUpdated(
                      settingsBloc.state.settings.copyWith(
                        theme: value,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        if (BlocProvider.of<AnilistAuthBloc>(context, listen: true).isConnected)
          SettingsSection(
            title: const Text('Anilist'),
            tiles: <SettingsTile>[
              /// Logout
              SettingsTile(
                leading: const AnikkiIcon(icon: Icons.logout_outlined),
                title: const Text('Logout'),
                description: const Text(
                    'Logout from Anilist. This will remove watch list related features.'),
                onPressed: (context) async {
                  BlocProvider.of<AnilistAuthBloc>(context)
                      .add(AnilistAuthLogoutRequested());
                },
              ),
            ],
          ),
      ],
    );
  }
}
