part of 'player_controls.dart';

class PlayerMovableControls extends StatefulWidget {
  const PlayerMovableControls({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PlayerMovableControls> createState() => _PlayerMovableControlsState();
}

class _PlayerMovableControlsState extends State<PlayerMovableControls> {
  double width = 700;
  double height = 120;

  double x = 0;
  double y = 0;

  Size storedScreenSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final videoBloc = BlocProvider.of<VideoPlayerBloc>(context, listen: true);
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
              onEnter: (_) =>
                  videoBloc.add(const VideoPlayerControlsHovered(true)),
              onExit: (_) =>
                  videoBloc.add(const VideoPlayerControlsHovered(false)),
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      bottom: 4.0,
                      top: 8.0,
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
