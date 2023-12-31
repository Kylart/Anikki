part of 'player_controls.dart';

class PlayerControlsShortcuts extends StatelessWidget {
  const PlayerControlsShortcuts({
    super.key,
    required this.player,
    required this.child,
  });

  final Player player;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        /// Play / Pause
        LogicalKeySet(LogicalKeyboardKey.space): playPauseIntent,

        /// Seek
        LogicalKeySet(LogicalKeyboardKey.arrowRight): forwardIntent,
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): rewindIntent,
        LogicalKeySet(LogicalKeyboardKey.shift, LogicalKeyboardKey.arrowRight):
            skipOpIntent,
        LogicalKeySet(LogicalKeyboardKey.shift, LogicalKeyboardKey.arrowLeft):
            backOpIntent,

        /// Exit
        LogicalKeySet(LogicalKeyboardKey.escape): ExitIntent(context),
      },
      child: Actions(
        dispatcher: _LoggingActionDispatcher(),
        actions: <Type, Action<Intent>>{
          /// Play / Pause
          PlayPauseIntent: PlayPauseAction(player: player),

          /// Seek
          SeekIntent: SeekAction(player: player),

          /// Exit
          ExitIntent: ExitAction(player: player),
        },
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}

class _LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    logger.info('Action invoked: $action($intent)');
    super.invokeAction(action, intent, context);

    return null;
  }
}
