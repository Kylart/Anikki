part of 'player_controls.dart';

class PlayerControlsStop extends StatelessWidget {
  const PlayerControlsStop({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => ExitAction(player: player).invoke(ExitIntent(context)),
      icon: const Icon(Ionicons.stop),
    );
  }
}
