part of 'player_controls.dart';

class PlayerControlsPlayPause extends StatefulWidget {
  const PlayerControlsPlayPause({
    super.key,
    required this.player,
    this.dense = false,
  });

  final Player player;
  final bool dense;

  @override
  State<PlayerControlsPlayPause> createState() =>
      _PlayerControlsPlayPauseState();
}

class _PlayerControlsPlayPauseState extends State<PlayerControlsPlayPause>
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
        player.stream.playing.listen((event) => setPlaybackMode(event));
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
    return IconButton(
      color: Colors.white,
      iconSize: widget.dense ? 20 : 40,
      icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: playPauseController,
      ),
      onPressed: () {
        PlayPauseAction(player: player).invoke(playPauseIntent);
      },
    );
  }
}
