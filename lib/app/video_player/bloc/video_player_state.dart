part of 'video_player_bloc.dart';

final class VideoPlayerState extends Equatable {
  const VideoPlayerState({
    this.hideControls = false,
    this.displayTapped = false,
    this.controlsHovered = false,
    this.fullscreen = false,
  });

  final bool hideControls;
  final bool displayTapped;
  final bool controlsHovered;

  final bool fullscreen;

  @override
  List<Object> get props => [
        hideControls,
        displayTapped,
        controlsHovered,
        fullscreen,
      ];

  VideoPlayerState copyWith({
    bool? hideControls,
    bool? displayTapped,
    bool? controlsHovered,
    bool? fullscreen,
  }) {
    return VideoPlayerState(
      hideControls: hideControls ?? this.hideControls,
      displayTapped: displayTapped ?? this.displayTapped,
      controlsHovered: controlsHovered ?? this.controlsHovered,
      fullscreen: fullscreen ?? this.fullscreen,
    );
  }

  @override
  String toString() {
    return [
      'VideoPlayerState(',
      'hideControls: $hideControls',
      'displayTapped: $displayTapped',
      'controlsHovered: $controlsHovered',
      'fullscreen: $fullscreen',
      ')',
    ].join(', ');
  }
}
