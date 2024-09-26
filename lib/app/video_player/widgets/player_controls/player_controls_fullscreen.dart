part of 'player_controls.dart';

class PlayerControlsFullscreen extends StatefulWidget {
  const PlayerControlsFullscreen({super.key});

  @override
  State<PlayerControlsFullscreen> createState() =>
      _PlayerControlsFullscreenState();
}

class _PlayerControlsFullscreenState extends State<PlayerControlsFullscreen> {
  @override
  void dispose() {
    if (isDesktop()) {
      windowManager.setFullScreen(false);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoBloc = BlocProvider.of<VideoPlayerBloc>(context, listen: true);

    return IconButton(
      onPressed: () => videoBloc.add(VideoPlayerToggleFullscreen()),
      icon: Icon(
        videoBloc.state.fullscreen
            ? HugeIcons.strokeRoundedArrowShrink
            : HugeIcons.strokeRoundedArrowExpand,
      ),
    );
  }
}
