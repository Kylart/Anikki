import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({
    super.key,
    required this.player,
    required this.playlist,
    required this.onVideoComplete,
    this.firstIndex,
  });

  final Player player;

  final int? firstIndex;
  final Playlist playlist;

  final void Function(Media media, double progress) onVideoComplete;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late final VideoController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoController(widget.player);

    Future.microtask(() async {
      await widget.player.open(widget.playlist);
      if (widget.firstIndex != null) {
        await widget.player.jump(widget.firstIndex!);
      }
      await widget.player.play();

      widget.player.stream.completed.listen((completed) {
        if (widget.player.state.duration == Duration.zero) return;
        if (!completed) return;

        final playlist = widget.player.state.playlist;
        widget.onVideoComplete(playlist.medias.elementAt(playlist.index), 1.0);
      });
    });
  }

  @override
  void dispose() {
    final playerState = widget.player.state;

    /// Trigger onVideoComplete
    final playlist = playerState.playlist;
    final progress =
        playerState.position.inSeconds / playerState.duration.inSeconds;

    widget.onVideoComplete(playlist.medias.elementAt(playlist.index), progress);

    widget.player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return Video(
          controller: controller,
          controls: NoVideoControls,
        );
      },
    );
  }
}
