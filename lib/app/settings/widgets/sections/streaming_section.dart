part of 'sections.dart';

class StreamingSection extends AbstractSettingsSection {
  const StreamingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);

    return SettingsSection(
      title: const Text('Streaming'),
      tiles: <SettingsTile>[
        /// Stream request type
        SettingsTile(
          leading: const Icon(HugeIcons.strokeRoundedTv01),
          title: const Text('Streaming method'),
          trailing: DropdownButton<StreamRequestType>(
            value: settingsBloc.state.settings.streamSettings.streamRequestType,
            items: StreamRequestType.values
                .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type.title),
                    ))
                .toList(),
            onChanged: (value) {
              if (value == null) return;

              settingsBloc.add(
                SettingsUpdated(
                  settingsBloc.state.settings.copyWith(
                    streamSettings:
                        settingsBloc.state.settings.streamSettings.copyWith(
                      streamRequestType: value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if ([
          StreamRequestType.online,
          StreamRequestType.choose,
        ].contains(
          settingsBloc.state.settings.streamSettings.streamRequestType,
        ))
          SettingsTile(
            leading: const Icon(HugeIcons.strokeRoundedSubtitle),
            title: const Text('Online video type'),
            description:
                const Text('This setting will only apply for online streaming'),
            trailing: DropdownButton<SubOrDub>(
              value: settingsBloc.state.settings.streamSettings.videoType,
              items: SubOrDub.values
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type.title),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;

                settingsBloc.add(
                  SettingsUpdated(
                    settingsBloc.state.settings.copyWith(
                      streamSettings:
                          settingsBloc.state.settings.streamSettings.copyWith(
                        videoType: value,
                      ),
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
