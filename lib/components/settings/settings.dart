import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/providers/user_preferences/theme.dart';

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
              trailing: DropdownButton<ThemeMode>(
                onChanged: (value) {
                  if (value != null) {
                    context.read<AnikkiTheme>().theme = value;
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: ListTile(
                      leading: Icon(Icons.device_hub),
                      title: Text('System'),
                    ),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: ListTile(
                      leading: Icon(Icons.dark_mode_outlined),
                      title: Text('Dark'),
                    ),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: ListTile(
                      leading: Icon(Icons.light_mode_outlined),
                      title: Text('Light'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
