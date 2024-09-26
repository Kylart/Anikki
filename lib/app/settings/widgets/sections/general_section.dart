part of 'sections.dart';

class GeneralSection extends AbstractSettingsSection {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);

    return SettingsSection(
      title: const Text('General'),
      tiles: <SettingsTile>[
        SettingsTile(
          leading: const Icon(HugeIcons.strokeRoundedWrench01),
          title: const Text('Version'),
          trailing: FutureBuilder(
            future: rootBundle.loadString('pubspec.yaml'),
            builder: (context, data) {
              if (!data.hasData || data.data == null) {
                return const SizedBox();
              }

              final yaml = loadYaml(data.data!);

              return Text(' v${yaml['version']}');
            },
          ),
        ),

        /// Theme
        SettingsTile(
          leading: const Icon(HugeIcons.strokeRoundedSun02),
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
    );
  }
}
