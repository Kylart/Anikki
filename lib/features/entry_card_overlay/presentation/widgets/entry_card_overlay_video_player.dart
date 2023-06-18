import 'package:anikki/core/providers/external_media_provider/external_media_provider.dart';
import 'package:anikki/core/providers/external_media_provider/utils.dart';
import 'package:anikki/features/video_player/presentation/view/video_player_view.dart';
import 'package:flutter/material.dart';

class EntryCardOverlayVideoPlayer extends StatefulWidget {
  const EntryCardOverlayVideoPlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<EntryCardOverlayVideoPlayer> createState() =>
      _EntryCardOverlayVideoPlayerState();
}

class _EntryCardOverlayVideoPlayerState
    extends State<EntryCardOverlayVideoPlayer> {
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
      onVideoComplete: (_) {},
      forceSmallControls: true,
    );
  }
}
