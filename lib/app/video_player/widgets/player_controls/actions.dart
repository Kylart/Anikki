part of 'player_controls.dart';

abstract class PlayerAction<T extends Intent> extends Action<T> {
  PlayerAction({required this.player});

  final Player player;
}

class PlayPauseAction extends PlayerAction<PlayPauseIntent> {
  PlayPauseAction({required super.player});

  @override
  void invoke(covariant PlayPauseIntent intent) {
    player.playOrPause();
  }
}

class SeekAction extends PlayerAction<SeekIntent> {
  SeekAction({required super.player});

  @override
  void invoke(covariant SeekIntent intent) {
    player.seek(player.state.position + intent.duration);
  }
}

class ExitAction extends PlayerAction<ExitIntent> {
  ExitAction({required super.player});

  @override
  void invoke(covariant ExitIntent intent) {
    BlocProvider.of<VideoPlayerBloc>(intent.context).add(
      const VideoPlayerClosed(),
    );

    final nav = Navigator.of(intent.context);
    nav.pop();
  }
}
