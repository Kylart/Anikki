// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

class VideoPlayerState extends Equatable {
  const VideoPlayerState({
    required this.player,
    this.hideControls = false,
    this.displayTapped = false,
    this.controlsHovered = false,
    this.fullscreen = false,
  });

  final mk.Player player;

  final bool hideControls;
  final bool displayTapped;
  final bool controlsHovered;

  final bool fullscreen;

  @override
  List<Object> get props => [
        player,
        hideControls,
        displayTapped,
        controlsHovered,
        fullscreen,
      ];

  VideoPlayerState copyWith({
    mk.Player? player,
    bool? hideControls,
    bool? displayTapped,
    bool? controlsHovered,
    bool? fullscreen,
  }) {
    return VideoPlayerState(
      player: player ?? this.player,
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
      'player: $player',
      'hideControls: $hideControls',
      'displayTapped: $displayTapped',
      'controlsHovered: $controlsHovered',
      'fullscreen: $fullscreen',
      ')',
    ].join(', ');
  }
}
