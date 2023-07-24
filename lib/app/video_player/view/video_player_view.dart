import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/core/core.dart' as core;
import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';
import 'package:anikki/app/video_player/widgets/player_widget.dart';
import 'package:anikki/app/video_player/widgets/player_controls/player_controls.dart';

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
  final core.LocalFile? first;

  /// Array of URLs.
  final List<String> sources;

  final void Function(Media media) onVideoComplete;

  final bool forceSmallControls;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView>
    with WidgetsBindingObserver {
  final Player player = Player();

  int? get firstIndex =>
      widget.first == null ? null : widget.sources.indexOf(widget.first!.path);

  /// Actual playlist that the player will play
  Playlist get playlist =>
      Playlist(widget.sources.map((e) => Media(e)).toList());

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AppLifecycleState.resumed == state) {
      player.play();
    } else {
      if (player.state.playing) player.pause();
    }
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
