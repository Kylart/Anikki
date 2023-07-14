part of 'player_controls.dart';

class PlayerControlsProgress extends StatelessWidget {
  const PlayerControlsProgress({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: player.stream.position,
      builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
        final durationState = snapshot.data;
        final progress = durationState ?? Duration.zero;
        final total = player.state.duration;

        return ProgressBar(
          progress: progress,
          total: total,
          barHeight: 3,
          timeLabelLocation: TimeLabelLocation.sides,
          timeLabelType: TimeLabelType.totalTime,
          onSeek: (duration) {
            player.seek(duration);
          },
          buffered: player.state.buffer,
        );
      },
    );
  }
}
