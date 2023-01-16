import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:kawanime/providers/user_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('General'),
          tiles: <SettingsTile>[
            /// Theme
            SettingsTile(
              leading: const Icon(Icons.format_paint),
              title: const Text('Dark Theme'),
              trailing: Switch(
                onChanged: (bool value) {
                  context.read<UserPreferences>().darkTheme = value;
                },
                value: context.watch<UserPreferences>().darkTheme,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
