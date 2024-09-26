part of 'sections.dart';

class VideoPlayerSection extends AbstractSettingsSection {
  const VideoPlayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context, listen: true);

    return SettingsSection(
      title: const Text('Video Player'),
      tiles: <SettingsTile>[
        /// Play inside
        SettingsTile.switchTile(
          initialValue: settingsBloc.state.settings.videoPlayerSettings.inside,
          leading: const Icon(HugeIcons.strokeRoundedPlay),
          title: const Text('Use Anikki video player'),
          onToggle: (value) {
            settingsBloc.add(
              SettingsUpdated(
                settingsBloc.state.settings.copyWith(
                  videoPlayerSettings:
                      settingsBloc.state.settings.videoPlayerSettings.copyWith(
                    inside: value,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
