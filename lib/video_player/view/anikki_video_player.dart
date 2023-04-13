import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/video_player/bloc/video_player_bloc.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/video_player/video_player.dart';
import 'package:anikki/video_player/widgets/player_widget.dart';
import 'package:anikki/video_player/widgets/player_controls/player_controls.dart';

class AnikkiVideoPlayer implements VideoPlayer {
  AnikkiVideoPlayer({
    required this.sources,
    this.first,
    this.onVideoComplete,
  });

  /// Player instace
  final player = Player();

  /// First element of the playlist to be played. If `null`, the first element played will
  /// be the very first element given on `sources`.
  final LocalFile? first;
  int? get firstIndex => first == null ? null : sources.indexOf(first!.path);

  /// Array of URLs.
  final List<String> sources;

  /// Actual playlist that the player will play
  Playlist get playlist => Playlist(sources.map((e) => Media(e)).toList());

  final void Function(Media media)? onVideoComplete;

  @override
  Future<void> stop() async {}

  @override
  Widget widget() {
    return BlocProvider(
      create: (context) => VideoPlayerBloc(player),
      child: Stack(
        children: [
          Positioned.fill(
            child: PlayerWidget(
              firstIndex: firstIndex,
              player: player,
              playlist: playlist,
              onVideoComplete: onVideoComplete,
            ),
          ),
          Positioned.fill(
            child: PlayerControls(
              player: player,
            ),
          ),
        ],
      ),
    );
  }
}
