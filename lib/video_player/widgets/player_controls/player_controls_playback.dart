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

class _PlayerControlsPlaybackState extends State<PlayerControlsPlayback>
    with SingleTickerProviderStateMixin {
  Player get player => widget.player;

  bool isPlaying = true;

  late StreamSubscription<bool> playPauseStream;
  late AnimationController playPauseController;

  @override
  void initState() {
    super.initState();
    playPauseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    playPauseStream =
        player.streams.playing.listen((event) => setPlaybackMode(event));
    if (player.state.playing) playPauseController.forward();
  }

  @override
  void dispose() {
    playPauseStream.cancel();
    playPauseController.dispose();
    super.dispose();
  }

  void setPlaybackMode(bool isPlaying) {
    if (isPlaying) {
      playPauseController.forward();
    } else {
      playPauseController.reverse();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
        IconButton(
          color: Colors.white,
          iconSize: 40,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: playPauseController,
          ),
          onPressed: () {
            PlayPauseAction(player: player).invoke(playPauseIntent);
          },
        ),
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
                player.state.duration - const Duration(milliseconds: 10),
              ),
            ),
            icon: const Icon(Icons.skip_next_outlined),
          ),
      ],
    );
  }
}
