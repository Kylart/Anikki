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
            icon: const Icon(HugeIcons.strokeRoundedPrevious),
          ),
        if (!widget.dense)
          IconButton(
            onPressed: () => SeekAction(player: player).invoke(rewindIntent),
            icon: const Icon(HugeIcons.strokeRoundedGoBackward10Sec),
          ),
        PlayerControlsPlayPause(player: player),
        if (!widget.dense)
          IconButton(
            onPressed: () => SeekAction(player: player).invoke(forwardIntent),
            icon: const Icon(HugeIcons.strokeRoundedGoForward10Sec),
          ),
        IconButton(
          onPressed: () => SeekAction(player: player).invoke(skipOpIntent),
          icon: const Icon(HugeIcons.strokeRoundedForward02),
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
            icon: const Icon(HugeIcons.strokeRoundedNext),
          ),
      ],
    );
  }
}
