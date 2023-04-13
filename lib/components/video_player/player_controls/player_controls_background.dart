part of 'player_controls.dart';

class PlayerControlsBackground extends StatelessWidget {
  const PlayerControlsBackground({
    super.key,
    required this.child,
    required this.onEnter,
    required this.onExit,
  });

  final Widget child;

  final void Function() onEnter;
  final void Function() onExit;

  @override
  Widget build(BuildContext context) {
    final useMovable = MediaQuery.of(context).size.width > 800;

    return useMovable
        ? PlayerMovableControls(
            onEnter: onEnter,
            onExit: onExit,
            child: child,
          )
        : PlayerNonMovableControls(
            onEnter: onEnter,
            onExit: onExit,
            child: child,
          );
  }
}
