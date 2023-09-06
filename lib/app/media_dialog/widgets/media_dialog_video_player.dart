import 'package:anikki/core/external_media_provider/external_media_provider.dart';
import 'package:anikki/core/external_media_provider/utils.dart';
import 'package:anikki/app/video_player/view/video_player_view.dart';
import 'package:flutter/material.dart';

class MediaDialogVideoPlayer extends StatefulWidget {
  const MediaDialogVideoPlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<MediaDialogVideoPlayer> createState() => _MediaDialogVideoPlayerState();
}

class _MediaDialogVideoPlayerState extends State<MediaDialogVideoPlayer> {
  @override
  void initState() {
    ExternalMediaProvider.create();
    super.initState();
  }

  @override
  void dispose() {
    ExternalMediaProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(widget.url);
    final media = ExternalMedia.redirect(uri);

    return VideoPlayerView(
      sources: [media.toString()],
      onVideoComplete: (_, __) {},
      forceSmallControls: true,
    );
  }
}
