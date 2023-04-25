part of 'player_controls.dart';

class PlayPauseIntent extends Intent {
  const PlayPauseIntent();
}

const playPauseIntent = PlayPauseIntent();

class SeekIntent extends Intent {
  const SeekIntent(this.duration);

  final Duration duration;
}

const forwardIntent = SeekIntent(Duration(seconds: 10));
const rewindIntent = SeekIntent(Duration(seconds: -10));
const skipOpIntent = SeekIntent(Duration(seconds: 85));
const backOpIntent = SeekIntent(Duration(seconds: -90));

class ExitIntent extends Intent {
  const ExitIntent(this.context);

  final BuildContext context;
}
