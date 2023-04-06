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
      Window.exitFullscreen();
    } else {
      Window.enterFullscreen();
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
      onPressed: () async {
        if (isDesktop()) toggle();
      },
      icon: Icon(
        isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
      ),
    );
  }
}
