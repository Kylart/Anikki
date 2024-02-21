import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/app/video_player/view/video_player_view.dart';
import 'package:anikki/core/external_media_provider/external_media_provider.dart';
import 'package:anikki/core/external_media_provider/utils.dart';

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

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: VideoPlayerView(
            sources: [Media(media.toString())],
            onVideoComplete: (_, __) {},
            forceSmallControls: true,
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: IconButton.filledTonal(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Ionicons.close_outline),
          ),
        ),
      ],
    );
  }
}
