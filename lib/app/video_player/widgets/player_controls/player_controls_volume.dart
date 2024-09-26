part of 'player_controls.dart';

class PlayerControlsVolume extends StatefulWidget {
  const PlayerControlsVolume({super.key, required this.player});

  final Player player;

  @override
  State<PlayerControlsVolume> createState() => _PlayerControlsVolumeState();
}

class _PlayerControlsVolumeState extends State<PlayerControlsVolume> {
  double? lastVolume;
  bool isMuted = false;

  void mute(double volume) {
    widget.player.setVolume(0);

    setState(() {
      lastVolume = volume;
      isMuted = true;
    });
  }

  void unmute() {
    widget.player.setVolume(lastVolume ?? 1.0);

    setState(() {
      isMuted = false;
      lastVolume = null;
    });
  }

  IconData icon(double volume) {
    if (isMuted || volume == 0) return HugeIcons.strokeRoundedVolumeMute01;
    if (volume < 50) return HugeIcons.strokeRoundedVolumeLow;
    return HugeIcons.strokeRoundedVolumeHigh;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: widget.player.stream.volume,
      builder: (context, snapshot) {
        final volume = snapshot.data ?? 100.0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (volume > 0) {
                  mute(volume);
                } else {
                  unmute();
                }
              },
              icon: Icon(
                icon(volume),
              ),
            ),
            SizedBox(
              width: 150,
              child: Slider(
                value: volume / 100,
                label: volume.round().toString(),
                divisions: 100,
                onChanged: (volume) {
                  widget.player.setVolume(volume * 100);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
