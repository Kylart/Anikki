part of 'player_controls.dart';

class PlayerControlsBackground extends StatelessWidget {
  const PlayerControlsBackground({
    super.key,
    required this.child,
    this.nonMovable = false,
  });

  final Widget child;
  final bool nonMovable;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 1200;

    return (isDesktop() && isLargeScreen) && !nonMovable
        ? PlayerMovableControls(
            child: child,
          )
        : PlayerNonMovableControls(
            child: child,
          );
  }
}
