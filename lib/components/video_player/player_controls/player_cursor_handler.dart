part of 'player_controls.dart';

class PlayerCursorHandler extends StatefulWidget {
  const PlayerCursorHandler({
    super.key,
    required this.player,
    required this.child,
    required this.hideControls,
    required this.onTapped,
    required this.onHover,
  });

  final Player player;
  final Widget child;

  final bool hideControls;
  final void Function() onTapped;
  final void Function() onHover;

  @override
  State<PlayerCursorHandler> createState() => _PlayerCursorHandlerState();
}

class _PlayerCursorHandlerState extends State<PlayerCursorHandler> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTapped(),
      child: MouseRegion(
        cursor: widget.hideControls
            ? SystemMouseCursors.none
            : SystemMouseCursors.basic,
        onHover: (_) => widget.onHover(),
        child: AbsorbPointer(
          absorbing: widget.hideControls,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: widget.hideControls ? 0.0 : 1.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
