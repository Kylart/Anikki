part of 'player_controls.dart';

class PlayerControlsVolumeBar extends StatelessWidget {
  const PlayerControlsVolumeBar({
    super.key,
    required this.show,
    required this.player,
  });

  final bool show;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: StreamBuilder(
        stream: player.stream.volume,
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();

          return SizedBox(
            height: 200,
            width: 20,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: FAProgressBar(
                      animatedDuration: const Duration(milliseconds: 150),
                      progressColor: Colors.white.withOpacity(0.9),
                      size: 22,
                      displayTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 8),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      currentValue: snapshot.data!,
                      displayText: '%',
                    ),
                  ),
                ),
                if (snapshot.data! == 0)
                  const Icon(Icons.volume_off)
                else if (snapshot.data! < 33)
                  const Icon(Icons.volume_mute)
                else if (snapshot.data! < 66)
                  const Icon(Icons.volume_down)
                else
                  const Icon(Icons.volume_up),
              ],
            ),
          );
        },
      ),
    );
  }
}
