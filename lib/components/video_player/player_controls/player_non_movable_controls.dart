part of 'player_controls.dart';

class PlayerNonMovableControls extends StatelessWidget {
  const PlayerNonMovableControls({super.key, required this.child, required this.onEnter, required this.onExit,});

  final Widget child;

  final void Function() onEnter;
  final void Function() onExit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          onEnter: (_) => onEnter(),
          onExit: (_) => onExit(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.black26],
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 4.0,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
