part of 'player_controls.dart';

class PlayerControlsBackground extends StatelessWidget {
  const PlayerControlsBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final useMovable = MediaQuery.of(context).size.width > 800;

    return useMovable
        ? PlayerMovableControls(
            child: child,
          )
        : PlayerNonMovableControls(
            child: child,
          );
  }
}
