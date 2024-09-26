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

  bool showSeekDuration = false;

  Duration seekDuration = Duration.zero;
  String get seekDurationString {
    final sign = seekDuration.isNegative ? '-' : '+';
    final minutes = seekDuration.inMinutes.abs();

    var seconds = '${seekDuration.inSeconds.abs() % 60}';

    if (seconds.toString().length == 1) seconds = '0$seconds';

    return '$sign$minutes:$seconds';
  }

  /// Drag is only available on mobile. However, a drag event should be ignored
  /// when starting on the very side of the device as to not act on the video
  /// when the user is using native gestures.
  ///
  /// A drag event should be ignore when not in the `kDragIgnorePercent` of the
  /// device.
  bool _shouldIgnoreDrag(BuildContext context, Offset position) {
    if (isDesktop()) return true;

    final screenSize = MediaQuery.of(context).size;

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

  void _hideDragBarControls() {
    volumeBarInterval?.cancel();
    brightnessBarInterval?.cancel();

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
  }

  @override
  void dispose() {
    volumeBarInterval?.cancel();
    brightnessBarInterval?.cancel();

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
        if (_shouldIgnoreDrag(context, details.globalPosition)) return;

        var value = details.delta.dx * 750;

        setState(() {
          seekDuration += Duration(
            milliseconds: value.toInt(),
          );
        });
      },
      onHorizontalDragEnd: (details) {
        if (_shouldIgnoreDrag(context, details.globalPosition)) return;

        widget.player.seek(
          widget.player.state.position + seekDuration,
        );

        setState(() {
          seekDuration = Duration.zero;
        });
      },
      onVerticalDragUpdate: (details) async {
        if (_shouldIgnoreDrag(context, details.globalPosition)) return;

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
      onVerticalDragCancel: _hideDragBarControls,
      onVerticalDragEnd: (_) => _hideDragBarControls(),
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
            ),
            if (seekDuration != Duration.zero)
              Positioned.fill(
                child: Center(
                  child: LayoutCard(
                    child: Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          seekDurationString,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
