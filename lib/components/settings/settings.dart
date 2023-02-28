import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/providers/user_preferences/dark_theme.dart';

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
                  context.read<DarkTheme>().active = value;
                },
                value: context.watch<DarkTheme>().active,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
