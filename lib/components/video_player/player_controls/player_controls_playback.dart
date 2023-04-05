part of 'player_controls.dart';

class PlayerControlsPlayback extends StatefulWidget {
  const PlayerControlsPlayback({
    super.key,
    required this.player,
    required this.playerInstance,
  });

  final DesktopPlayer playerInstance;
  final Player player;

  @override
  State<PlayerControlsPlayback> createState() => _PlayerControlsPlaybackState();
}

class _PlayerControlsPlaybackState extends State<PlayerControlsPlayback>
    with SingleTickerProviderStateMixin {
  DesktopPlayer get playerInstance => widget.playerInstance;
  Player get player => widget.player;

  bool isPlaying = true;

  late StreamSubscription<bool> playPauseStream;
  late AnimationController playPauseController;

  void forward(Duration time) {
    final Duration duration = player.state.position;

    player.seek(duration + time);
  }

  void rewind(Duration time) {
    final Duration duration = player.state.position;

    player.seek(duration - time);
  }

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
        IconButton(
          onPressed: () {
            rewind(const Duration(seconds: 10));
          },
          icon: const Icon(Icons.replay_10),
        ),
        IconButton(
          color: Colors.white,
          iconSize: 40,
          icon: AnimatedIcon(
              icon: AnimatedIcons.play_pause, progress: playPauseController),
          onPressed: () {
            if (player.state.playing) {
              player.pause();
              playPauseController.reverse();
            } else {
              player.play();
              playPauseController.forward();
            }
          },
        ),
        IconButton(
          onPressed: () {
            forward(
              const Duration(seconds: 10),
            );
          },
          icon: const Icon(Icons.forward_10),
        ),
        IconButton(
          onPressed: () {
            forward(
              const Duration(minutes: 1, seconds: 25),
            );
          },
          icon: const Icon(Icons.fast_forward),
        ),
      ],
    );
  }
}
