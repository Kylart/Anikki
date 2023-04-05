part of 'player_controls.dart';

class PlayerControlsStop extends StatelessWidget {
  const PlayerControlsStop({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final nav = Navigator.of(context);
        await player.dispose();
        nav.pop();
      },
      icon: const Icon(Icons.stop),
    );
  }
}
