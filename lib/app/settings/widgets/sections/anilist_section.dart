part of 'sections.dart';

class AnilistSection extends AbstractSettingsSection {
  const AnilistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: const Text('Anilist'),
      tiles: <SettingsTile>[
        /// Logout
        SettingsTile(
          leading: const AnikkiIcon(icon: Ionicons.log_out_outline),
          title: const Text('Logout'),
          description: const Text(
              'Logout from Anilist. This will remove watch list related features.'),
          onPressed: (context) async {
            BlocProvider.of<AnilistAuthBloc>(context)
                .add(AnilistAuthLogoutRequested());
          },
        ),
      ],
    );
  }
}
