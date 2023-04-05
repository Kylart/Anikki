part of 'player_controls.dart';

class PlayerCursorHandler extends StatefulWidget {
  const PlayerCursorHandler({
    super.key,
    required this.player,
    required this.child,
  });

  final Player player;
  final Widget child;

  @override
  State<PlayerCursorHandler> createState() => _PlayerCursorHandlerState();
}

class _PlayerCursorHandlerState extends State<PlayerCursorHandler>
    with ControlsMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.player.state.playing) {
          if (displayTapped) {
            setState(() {
              hideControls = true;
              displayTapped = false;
            });
          } else {
            cancelAndRestartTimer();
          }
        } else {
          setState(() => hideControls = true);
        }
      },
      child: MouseRegion(
        cursor:
            hideControls ? SystemMouseCursors.none : SystemMouseCursors.basic,
        onHover: (_) => cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: hideControls,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: hideControls ? 0.0 : 1.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
