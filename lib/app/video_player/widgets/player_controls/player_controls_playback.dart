part of 'player_controls.dart';

class PlayerControlsPlayback extends StatefulWidget {
  const PlayerControlsPlayback({
    super.key,
    required this.player,
    this.dense = false,
  });

  final Player player;
  final bool dense;

  @override
  State<PlayerControlsPlayback> createState() => _PlayerControlsPlaybackState();
}

class _PlayerControlsPlaybackState extends State<PlayerControlsPlayback> {
  Player get player => widget.player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!widget.dense)
          IconButton(
            onPressed: player.previous,
            icon: const Icon(Icons.skip_previous_outlined),
          ),
        if (!widget.dense)
          IconButton(
            onPressed: () => SeekAction(player: player).invoke(rewindIntent),
            icon: const Icon(Icons.replay_10),
          ),
        PlayerControlsPlayPause(player: player),
        if (!widget.dense)
          IconButton(
            onPressed: () => SeekAction(player: player).invoke(forwardIntent),
            icon: const Icon(Icons.forward_10),
          ),
        IconButton(
          onPressed: () => SeekAction(player: player).invoke(skipOpIntent),
          icon: const Icon(Icons.fast_forward),
        ),
        if (!widget.dense)
          IconButton(
            onPressed: () => SeekAction(player: player).invoke(
              SeekIntent(
                player.state.duration -
                    const Duration(milliseconds: 10) -
                    player.state.position,
              ),
            ),
            icon: const Icon(Icons.skip_next_outlined),
          ),
      ],
    );
  }
}
