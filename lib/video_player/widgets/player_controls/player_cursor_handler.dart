part of 'player_controls.dart';

class PlayerCursorHandler extends StatelessWidget {
  const PlayerCursorHandler({
    super.key,
    required this.player,
    required this.child,
  });

  final Player player;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final videoBloc = BlocProvider.of<VideoPlayerBloc>(context, listen: true);
    final hideControls = videoBloc.state.hideControls;
    final desktop = isDesktop();

    return GestureDetector(
      onTap: () => videoBloc.add(VideoPlayerDisplayTapped()),
      onLongPress: () {
        if (desktop) return;

        player.playOrPause();
        videoBloc.add(VideoPlayerResetShowTimer());
      },
      onDoubleTapDown: (details) {
        if (desktop) {
          videoBloc.add(VideoPlayerToggleFullscreen());
          return;
        }

        final screenWidth = MediaQuery.of(context).size.width;

        if (details.globalPosition.dx < screenWidth / 2) {
          player.seek(
            player.state.position + const Duration(seconds: -10),
          );
        } else {
          player.seek(
            player.state.position + const Duration(seconds: 10),
          );
        }
      },
      onHorizontalDragUpdate: (details) {
        player.seek(
          player.state.position + Duration(seconds: (details.delta.dx.toInt())),
        );
      },
      child: MouseRegion(
        cursor:
            hideControls ? SystemMouseCursors.none : SystemMouseCursors.basic,
        onHover: (_) => videoBloc.add(VideoPlayerResetShowTimer()),
        child: AbsorbPointer(
          absorbing: hideControls,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: hideControls ? 0.0 : 1.0,
            child: child,
          ),
        ),
      ),
    );
  }
}
