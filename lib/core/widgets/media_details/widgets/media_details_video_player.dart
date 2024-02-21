import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/core/external_media_provider/external_media_provider.dart';
import 'package:anikki/core/external_media_provider/utils.dart';
import 'package:anikki/app/video_player/view/video_player_view.dart';

class MediaDetailsVideoPlayer extends StatefulWidget {
  const MediaDetailsVideoPlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<MediaDetailsVideoPlayer> createState() =>
      _MediaDetailsVideoPlayerState();
}

class _MediaDetailsVideoPlayerState extends State<MediaDetailsVideoPlayer> {
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
      sources: [Media(media.toString())],
      onVideoComplete: (_, __) {},
      forceSmallControls: true,
    );
  }
}