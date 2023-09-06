import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/settings/widgets/settings_text_field.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final portrait = state is LayoutPortrait;

        return LayoutCard(
          transparent: portrait,
          child: Column(
            children: [
              if (!portrait)
                AppBar(
                  title: const Text('Settings'),
                ),
              Expanded(
                child: SettingsList(
                  sections: [
                    SettingsSection(
                      title: const Text('General'),
                      tiles: <SettingsTile>[
                        /// Theme
                        SettingsTile(
                          leading: const Icon(Ionicons.contrast_outline),
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
                    if (BlocProvider.of<AnilistAuthBloc>(context, listen: true)
                        .isConnected)
                      SettingsSection(
                        title: const Text('Anilist'),
                        tiles: <SettingsTile>[
                          /// Logout
                          SettingsTile(
                            leading: const AnikkiIcon(
                                icon: Ionicons.log_out_outline),
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
                          leading: const Icon(Ionicons.logo_rss),
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
                            leading:
                                const AnikkiIcon(icon: Ionicons.person_outline),
                            title: const Text('Username'),
                            trailing: SettingsTextField(
                              initialValue: settingsBloc
                                  .state.settings.transmissionSettings.username,
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
                            leading:
                                const AnikkiIcon(icon: Ionicons.key_outline),
                            title: const Text('Password'),
                            trailing: SettingsTextField(
                              initialValue: settingsBloc
                                  .state.settings.transmissionSettings.password,
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
                            leading:
                                const AnikkiIcon(icon: Ionicons.keypad_outline),
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
                            leading:
                                const AnikkiIcon(icon: Ionicons.person_outline),
                            title: const Text('Username'),
                            trailing: SettingsTextField(
                              initialValue: settingsBloc
                                  .state.settings.qBitTorrentSettings.username,
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
                            leading:
                                const AnikkiIcon(icon: Ionicons.key_outline),
                            title: const Text('Password'),
                            trailing: SettingsTextField(
                              initialValue: settingsBloc
                                  .state.settings.qBitTorrentSettings.password,
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
                            leading:
                                const AnikkiIcon(icon: Ionicons.keypad_outline),
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
