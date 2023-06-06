import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:anikki/features/video_player/bloc/video_player_bloc.dart';
import 'package:wakelock/wakelock.dart';

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

  final void Function(Media media) onVideoComplete;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late final VideoController controller;

  @override
  void initState() {
    super.initState();

    Wakelock.enable();

    Future.microtask(() async {
      controller = VideoController(widget.player);
      // Must be created before opening any media. Otherwise, a separate window will be created.
      setState(() {});

      await widget.player.open(widget.playlist);
      if (widget.firstIndex != null) {
        await widget.player.jump(widget.firstIndex!);
      }
      await widget.player.play();

      widget.player.streams.completed.listen((completed) {
        if (!completed) return;

        final playlist = widget.player.state.playlist;
        widget.onVideoComplete(playlist.medias.elementAt(playlist.index));
      });
    });
  }

  @override
  void dispose() {
    /// Enabling the screen to sleep again
    Wakelock.disable();

    /// Trigger onVideoComplete
    final playlist = widget.player.state.playlist;
    widget.onVideoComplete(playlist.medias.elementAt(playlist.index));

    Future.microtask(() async {
      await widget.player.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return Video(
          /// Pass the [controller] to display the video output.
          controller: controller,
        );
      },
    );
  }
}
