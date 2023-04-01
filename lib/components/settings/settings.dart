import 'package:anikki/helpers/capitalize.dart';
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
              title: const Text('Theme'),
              trailing: DropdownButton(
                value: context.watch<AnikkiTheme>().theme,
                items: ThemeMode.values
                    .map((mode) => DropdownMenuItem(
                          value: mode,
                          child: Text(mode.name.capitalize()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;

                  context.read<AnikkiTheme>().theme = value;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
