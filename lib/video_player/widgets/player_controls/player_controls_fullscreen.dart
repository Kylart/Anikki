part of 'player_controls.dart';

class PlayerControlsFullscreen extends StatefulWidget {
  const PlayerControlsFullscreen({super.key});

  @override
  State<PlayerControlsFullscreen> createState() =>
      _PlayerControlsFullscreenState();
}

class _PlayerControlsFullscreenState extends State<PlayerControlsFullscreen> {
  bool isFullscreen = false;

  void toggle() {
    if (isFullscreen) {
      if (isDesktop()) {
        Window.exitFullscreen();
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    } else {
      if (isDesktop()) {
        Window.enterFullscreen();
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
    }

    setState(() {
      isFullscreen = !isFullscreen;
    });
  }

  @override
  void dispose() {
    if (isFullscreen) toggle();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggle,
      icon: Icon(
        isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
      ),
    );
  }
}
