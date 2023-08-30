part of 'player_controls.dart';

class PlayerControlsBrightnessBar extends StatelessWidget {
  const PlayerControlsBrightnessBar({
    super.key,
    required this.show,
    required this.screenBrightness,
  });

  final bool show;
  final ScreenBrightness screenBrightness;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: StreamBuilder(
        stream: screenBrightness.onCurrentBrightnessChanged,
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();

          final value = snapshot.data! * 100;

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
                      currentValue: value,
                      displayText: '',
                    ),
                  ),
                ),
                if (value == 0)
                  const Icon(Ionicons.sunny_outline, size: 10)
                else if (value < 33)
                  const Icon(Ionicons.sunny_outline, size: 12)
                else if (value < 66)
                  const Icon(Ionicons.sunny_outline, size: 14)
                else
                  const Icon(Ionicons.sunny_outline, size: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
