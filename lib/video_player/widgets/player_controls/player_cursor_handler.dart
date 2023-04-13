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

    return GestureDetector(
      onTap: () => videoBloc.add(VideoPlayerDisplayTapped()),
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
