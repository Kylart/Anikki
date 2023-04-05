part of 'player_controls.dart';

class PlayerControlsFullscreen extends StatefulWidget {
  const PlayerControlsFullscreen({super.key});

  @override
  State<PlayerControlsFullscreen> createState() =>
      _PlayerControlsFullscreenState();
}

class _PlayerControlsFullscreenState extends State<PlayerControlsFullscreen> {
  bool isFullscreen = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (isDesktop()) {
          if (isFullscreen) {
            Window.exitFullscreen();
          } else {
            Window.enterFullscreen();
          }

          setState(() {
            isFullscreen = !isFullscreen;
          });
        }
      },
      icon: Icon(
        isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
      ),
    );
  }
}
