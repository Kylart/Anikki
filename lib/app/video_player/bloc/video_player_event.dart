part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();

  @override
  List<Object> get props => [];
}

class VideoPlayerPlayRequested extends VideoPlayerEvent {
  const VideoPlayerPlayRequested({
    required this.context,
    required this.sources,
    required this.onVideoComplete,
    this.first,
  });

  final BuildContext context;

  /// First element of the playlist to be played. If `null`, the first element played will
  /// be the very first element given on `sources`.
  final LocalFile? first;

  /// Array of URLs.
  final List<mk.Media> sources;

  final void Function(mk.Media media, double progress) onVideoComplete;

  @override
  List<Object> get props => [
        context,
        sources,
        if (first != null) first!,
      ];
}

class VideoPlayerClosed extends VideoPlayerEvent {
  const VideoPlayerClosed();
}

class VideoPlayerResetShowTimer extends VideoPlayerEvent {}

class VideoPlayerInit extends VideoPlayerEvent {}

class VideoPlayerControlsHovered extends VideoPlayerEvent {
  const VideoPlayerControlsHovered(this.isHovered);

  final bool isHovered;

  @override
  List<Object> get props => [isHovered];
}

class VideoPlayerDisplayTapped extends VideoPlayerEvent {}

class VideoPlayerStateUpdated extends VideoPlayerEvent {
  const VideoPlayerStateUpdated(this.state);

  final VideoPlayerState state;

  @override
  List<Object> get props => [state];
}

class VideoPlayerToggleFullscreen extends VideoPlayerEvent {}
