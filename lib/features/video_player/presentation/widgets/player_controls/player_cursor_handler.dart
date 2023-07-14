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
  bool showVolumeBar = false;
  bool showBrightnessBar = false;

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
      onVerticalDragUpdate: (details) {
        if (_shouldIgnoreDrag(context, details)) return;

        final currentVolume = widget.player.state.volume;
        final delta = details.primaryDelta?.ceilToDouble() ?? 0;

        final newVolume = currentVolume - delta;

        if (delta.sign < 0) {
          widget.player.setVolume(min(newVolume, 100.0));
        } else {
          widget.player.setVolume(max(newVolume, 0.0));
        }
      },
      child: MouseRegion(
        cursor:
            hideControls ? SystemMouseCursors.none : SystemMouseCursors.basic,
        onHover: (_) {
          if (desktop) videoBloc.add(VideoPlayerResetShowTimer());
        },
        child: AbsorbPointer(
          absorbing: hideControls,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: hideControls ? 0.0 : 1.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
