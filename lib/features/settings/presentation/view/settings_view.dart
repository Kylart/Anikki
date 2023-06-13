import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/features/settings/presentation/widgets/settings_text_field.dart';
import 'package:anikki/core/models/torrent_type.dart';
import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/core/helpers/capitalize.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
        SettingsSection(
          title: const Text('Torrent Client'),
          tiles: [
            SettingsTile(
              leading: const Icon(Icons.home_repair_service_outlined),
              title: const Text('Torrent Client type'),
              trailing: DropdownButton<TorrentType>(
                value: settingsBloc.state.settings.torrentType,
                items: TorrentType.values
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.title()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;

                  settingsBloc.add(
                    SettingsUpdated(
                      settingsBloc.state.settings.copyWith(
                        torrentType: value,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (settingsBloc.state.settings.torrentType ==
                TorrentType.transmission) ...[
              SettingsTile(
                key: const Key('transmission-username'),
                leading: const AnikkiIcon(icon: Icons.account_circle_outlined),
                title: const Text('Username'),
                trailing: SettingsTextField(
                  initialValue:
                      settingsBloc.state.settings.transmissionSettings.username,
                  onChanged: (value) {
                    settingsBloc.add(
                      SettingsUpdated(
                        settingsBloc.state.settings.copyWith(
                          transmissionSettings: settingsBloc
                              .state.settings.transmissionSettings
                              .copyWith(
                            username: value,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                key: const Key('transmission-password'),
                leading: const AnikkiIcon(icon: Icons.password),
                title: const Text('Password'),
                trailing: SettingsTextField(
                  initialValue:
                      settingsBloc.state.settings.transmissionSettings.password,
                  obscureText: true,
                  onChanged: (value) {
                    settingsBloc.add(
                      SettingsUpdated(
                        settingsBloc.state.settings.copyWith(
                          transmissionSettings: settingsBloc
                              .state.settings.transmissionSettings
                              .copyWith(
                            password: value,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                key: const Key('transmission-port'),
                leading: const AnikkiIcon(icon: Icons.numbers),
                title: const Text('Port'),
                trailing: SettingsTextField(
                  isNumber: true,
                  initialValue: settingsBloc
                      .state.settings.transmissionSettings.port
                      .toString(),
                  onChanged: (value) {
                    settingsBloc.add(
                      SettingsUpdated(
                        settingsBloc.state.settings.copyWith(
                          transmissionSettings: settingsBloc
                              .state.settings.transmissionSettings
                              .copyWith(
                            port: int.tryParse(value),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            if (settingsBloc.state.settings.torrentType ==
                TorrentType.qbittorrent) ...[
              SettingsTile(
                key: const Key('qbittorent-username'),
                leading: const AnikkiIcon(icon: Icons.account_circle_outlined),
                title: const Text('Username'),
                trailing: SettingsTextField(
                  initialValue:
                      settingsBloc.state.settings.qBitTorrentSettings.username,
                  onChanged: (value) {
                    settingsBloc.add(
                      SettingsUpdated(
                        settingsBloc.state.settings.copyWith(
                          qBitTorrentSettings: settingsBloc
                              .state.settings.qBitTorrentSettings
                              .copyWith(
                            username: value,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                key: const Key('qbittorent-password'),
                leading: const AnikkiIcon(icon: Icons.password),
                title: const Text('Password'),
                trailing: SettingsTextField(
                  initialValue:
                      settingsBloc.state.settings.qBitTorrentSettings.password,
                  obscureText: true,
                  onChanged: (value) {
                    settingsBloc.add(
                      SettingsUpdated(
                        settingsBloc.state.settings.copyWith(
                          qBitTorrentSettings: settingsBloc
                              .state.settings.qBitTorrentSettings
                              .copyWith(
                            password: value,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                key: const Key('qbittorent-port'),
                leading: const AnikkiIcon(icon: Icons.numbers),
                title: const Text('Port'),
                trailing: SettingsTextField(
                  isNumber: true,
                  initialValue: settingsBloc
                      .state.settings.qBitTorrentSettings.port
                      .toString(),
                  onChanged: (value) {
                    settingsBloc.add(
                      SettingsUpdated(
                        settingsBloc.state.settings.copyWith(
                          qBitTorrentSettings: settingsBloc
                              .state.settings.qBitTorrentSettings
                              .copyWith(
                            port: int.tryParse(value),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
