import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:anikki/video_player/bloc/video_player_bloc.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({
    super.key,
    required this.player,
    required this.playlist,
    this.firstIndex,
    this.onVideoComplete,
  });

  final Player player; 

  final int? firstIndex;
  final Playlist playlist;

  final void Function(Media media)? onVideoComplete;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  // Reference to the [VideoController] instance from `package:media_kit_video`.
  VideoController? controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // Create a [VideoController] instance from `package:media_kit_video`.
      // Pass the [handle] of the [Player] from `package:media_kit` to the [VideoController] constructor.
      controller = await VideoController.create(widget.player);
      // Must be created before opening any media. Otherwise, a separate window will be created.
      setState(() {});

      await widget.player.open(widget.playlist);

      if (widget.firstIndex != null) {
        await widget.player.jump(widget.firstIndex!);
      }

      await widget.player.play();

      if (widget.onVideoComplete != null) {
        widget.player.streams.completed.listen((completed) {
          if (!completed) return;

          final playlist = widget.player.state.playlist;
          widget.onVideoComplete!(playlist.medias.elementAt(playlist.index));
        });
      }
    });
  }

  @override
  void dispose() {
    Future.microtask(() async {
      // Release allocated replaylists back to the system.
      await controller?.dispose();
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
