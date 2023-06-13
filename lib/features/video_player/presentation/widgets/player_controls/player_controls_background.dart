part of 'player_controls.dart';

class PlayerControlsBackground extends StatelessWidget {
  const PlayerControlsBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 1200;

    return isDesktop() && isLargeScreen
        ? PlayerMovableControls(
            child: child,
          )
        : PlayerNonMovableControls(
            child: child,
          );
  }
}
