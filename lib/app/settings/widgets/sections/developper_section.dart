part of 'sections.dart';

class DevelopperSection extends AbstractSettingsSection {
  const DevelopperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: const Text('Developper'),
      tiles: [
        SettingsTile(
          leading: const Icon(HugeIcons.strokeRoundedMessage01),
          title: const Text('Show logs'),
          onPressed: (context) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: logger),
            ));
          },
        ),
      ],
    );
  }
}
