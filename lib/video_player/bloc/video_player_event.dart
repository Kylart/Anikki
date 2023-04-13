part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();

  @override
  List<Object> get props => [];
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