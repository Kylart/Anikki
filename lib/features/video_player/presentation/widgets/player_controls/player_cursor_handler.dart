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

class _PlayerCursorHandlerState extends State<PlayerCursorHandler> {
  final ScreenBrightness screenBrightness = ScreenBrightness();

  Timer? volumeBarInterval;
  bool showVolumeBar = false;

  Timer? brightnessBarInterval;
  bool showBrightnessBar = false;

  Timer? seekNumberInterval;
  bool showSeekNumber = false;

  /// Drag is only available on mobile. However, a drag event should be ignored
  /// when starting on the very side of the device as to not act on the video
  /// when the user is using native gestures.
  ///
  /// A drag event should be ignore when not in the `kDragIgnorePercent` of the
  /// device.
  bool _shouldIgnoreDrag(BuildContext context, DragUpdateDetails details) {
    if (isDesktop()) return true;

    final screenSize = MediaQuery.of(context).size;
    final position = details.globalPosition;

    return !(
        // Height top
        position.dy < screenSize.height - 20 &&

            // Height bottom
            position.dy > 20 &&

            // Width right
            position.dx < screenSize.width - 60 &&

            // Width left
            position.dx > 60);
  }

  void _hideDragControls() {
    volumeBarInterval?.cancel();
    brightnessBarInterval?.cancel();
    seekNumberInterval?.cancel();

    volumeBarInterval = Timer(
      const Duration(seconds: 3),
      () => setState(() {
        showVolumeBar = false;
      }),
    );

    brightnessBarInterval = Timer(
      const Duration(seconds: 3),
      () => setState(() {
        showBrightnessBar = false;
      }),
    );

    seekNumberInterval = Timer(
      const Duration(seconds: 3),
      () => setState(() {
        showSeekNumber = false;
      }),
    );
  }

  @override
  void dispose() {
    volumeBarInterval?.cancel();
    brightnessBarInterval?.cancel();
    seekNumberInterval?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoBloc = BlocProvider.of<VideoPlayerBloc>(context, listen: true);
    final hideControls = videoBloc.state.hideControls;
    final desktop = isDesktop();

    return GestureDetector(
      onTap: () => videoBloc.add(VideoPlayerDisplayTapped()),
      onLongPress: () {
        if (desktop) return;

        widget.player.playOrPause();
        videoBloc.add(VideoPlayerResetShowTimer());
      },
      onDoubleTapDown: (details) {
        if (desktop) {
          videoBloc.add(VideoPlayerToggleFullscreen());
          return;
        }

        final screenWidth = MediaQuery.of(context).size.width;

        if (details.globalPosition.dx < screenWidth / 2) {
          widget.player.seek(
            widget.player.state.position + const Duration(seconds: -10),
          );
        } else {
          widget.player.seek(
            widget.player.state.position + const Duration(seconds: 10),
          );
        }
      },
      onHorizontalDragUpdate: (details) {
        if (_shouldIgnoreDrag(context, details)) return;

        final delta = details.primaryDelta;

        if (delta == null) return;

        var value = delta.ceilToDouble() * 2;

        if (value.abs() < 5) return;

        widget.player.seek(
          widget.player.state.position +
              Duration(
                seconds: value.toInt(),
              ),
        );
      },
      onVerticalDragUpdate: (details) async {
        if (_shouldIgnoreDrag(context, details)) return;

        final delta = details.primaryDelta?.ceilToDouble() ?? 0;

        final isLeftSide =
            details.globalPosition.dx < MediaQuery.of(context).size.width / 2;

        if (isLeftSide) {
          if (!showBrightnessBar) {
            setState(() {
              showBrightnessBar = true;
            });
          }

          final currentBrightness = await screenBrightness.current;
          final newBrightness = ((currentBrightness * 100 - delta) / 100.0);

          screenBrightness.setScreenBrightness(
            max(min(newBrightness, 1), 0),
          );
        } else {
          if (!showVolumeBar) {
            setState(() {
              showVolumeBar = true;
            });
          }

          final currentVolume = widget.player.state.volume;

          final newVolume = currentVolume - delta;

          if (delta.sign < 0) {
            widget.player.setVolume(min(newVolume, 100.0));
          } else {
            widget.player.setVolume(max(newVolume, 0.0));
          }
        }
      },
      onVerticalDragCancel: _hideDragControls,
      onVerticalDragEnd: (_) => _hideDragControls(),
      child: MouseRegion(
        cursor:
            hideControls ? SystemMouseCursors.none : SystemMouseCursors.basic,
        onHover: (_) {
          if (desktop) videoBloc.add(VideoPlayerResetShowTimer());
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: AbsorbPointer(
                absorbing: hideControls,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: hideControls ? 0.0 : 1.0,
                  child: widget.child,
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlayerControlsBrightnessBar(
                      show: showBrightnessBar,
                      screenBrightness: screenBrightness,
                    ),
                    PlayerControlsVolumeBar(
                      show: showVolumeBar,
                      player: widget.player,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
