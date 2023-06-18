import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';
import 'package:anikki/features/library/domain/models/local_file.dart';
import 'package:anikki/features/video_player/presentation/widgets/player_widget.dart';
import 'package:anikki/features/video_player/presentation/widgets/player_controls/player_controls.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.sources,
    required this.onVideoComplete,
    this.forceSmallControls = false,
    this.first,
  });

  /// First element of the playlist to be played. If `null`, the first element played will
  /// be the very first element given on `sources`.
  final LocalFile? first;

  /// Array of URLs.
  final List<String> sources;

  final void Function(Media media) onVideoComplete;

  final bool forceSmallControls;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  final Player player = Player();

  int? get firstIndex =>
      widget.first == null ? null : widget.sources.indexOf(widget.first!.path);

  /// Actual playlist that the player will play
  Playlist get playlist =>
      Playlist(widget.sources.map((e) => Media(e)).toList());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: PlayerWidget(
                firstIndex: firstIndex,
                player: player,
                playlist: playlist,
                onVideoComplete: widget.onVideoComplete,
              ),
            ),
            Positioned.fill(
              child: widget.forceSmallControls
                  ? PlayerControlsReduced(player: player)
                  : PlayerControls(player: player),
            ),
          ],
        );
      },
    );
  }
}
