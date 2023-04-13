// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

class VideoPlayerState extends Equatable {
  const VideoPlayerState({
    this.hideControls = false,
    this.displayTapped = false,
    this.controlsHovered = false,
  });

  final bool hideControls;
  final bool displayTapped;
  final bool controlsHovered;

  @override
  List<Object> get props => [
        hideControls,
        displayTapped,
        controlsHovered,
      ];

  VideoPlayerState copyWith({
    bool? hideControls,
    bool? displayTapped,
    bool? controlsHovered,
  }) {
    return VideoPlayerState(
      hideControls: hideControls ?? this.hideControls,
      displayTapped: displayTapped ?? this.displayTapped,
      controlsHovered: controlsHovered ?? this.controlsHovered,
    );
  }

  @override
  String toString() {
    return [
      'VideoPlayerState(',
      'hideControls: $hideControls',
      'displayTapped: $displayTapped',
      'controlsHovered: $controlsHovered',
      ')',
    ].join(', ');
  }
}
