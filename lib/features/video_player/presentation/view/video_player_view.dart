import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';
import 'package:anikki/features/library/domain/models/local_file.dart';
import 'package:anikki/features/video_player/presentation/widgets/player_widget.dart';
import 'package:anikki/features/video_player/presentation/widgets/player_controls/player_controls.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({
    super.key,
    required this.sources,
    required this.onVideoComplete,
    this.first,
  });

  /// First element of the playlist to be played. If `null`, the first element played will
  /// be the very first element given on `sources`.
  final LocalFile? first;
  int? get firstIndex => first == null ? null : sources.indexOf(first!.path);

  /// Array of URLs.
  final List<String> sources;

  /// Actual playlist that the player will play
  Playlist get playlist => Playlist(sources.map((e) => Media(e)).toList());

  final void Function(Media media) onVideoComplete;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: PlayerWidget(
                firstIndex: firstIndex,
                player: state.player,
                playlist: playlist,
                onVideoComplete: onVideoComplete,
              ),
            ),
            Positioned.fill(
              child: PlayerControls(
                player: state.player,
              ),
            ),
          ],
        );
      },
    );
  }
}
