part of 'player_controls.dart';

class PlayerMovableControls extends StatefulWidget {
  const PlayerMovableControls({
    super.key,
    required this.child,
    required this.onEnter,
    required this.onExit,
  });

  final Widget child;

  final void Function() onEnter;
  final void Function() onExit;

  @override
  State<PlayerMovableControls> createState() => _PlayerMovableControlsState();
}

class _PlayerMovableControlsState extends State<PlayerMovableControls> {
  double width = 700;
  double height = 90;

  double x = 0;
  double y = 0;

  Size storedScreenSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize != storedScreenSize) {
      setState(() {
        x = (screenSize.width - width) / 2;
        y = screenSize.height / 7;

        storedScreenSize = screenSize;
      });
    }

    return Stack(
      children: [
        Positioned(
          left: x,
          bottom: y,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                final newX = x + details.delta.dx;
                final newY = y - details.delta.dy;

                if (newX >= 0 && newX <= (screenSize.width - width)) {
                  x = newX;
                }

                if (newY >= 0 && newY <= (screenSize.height - height)) {
                  y = newY;
                }
              });
            },
            child: MouseRegion(
              onEnter: (_) => widget.onEnter(),
              onExit: (_) => widget.onExit(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                constraints: BoxConstraints(
                  maxHeight: screenSize.height,
                  maxWidth: screenSize.width,
                ),
                height: height,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 4.0,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
