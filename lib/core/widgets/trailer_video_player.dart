import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/app/video_player/view/video_player_view.dart';
import 'package:anikki/core/external_media_provider/external_media_provider.dart';
import 'package:anikki/core/external_media_provider/utils.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class TrailerVideoPlayer extends StatefulWidget {
  const TrailerVideoPlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<TrailerVideoPlayer> createState() => _TrailerVideoPlayerState();
}

class _TrailerVideoPlayerState extends State<TrailerVideoPlayer> {
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

    final playerView = VideoPlayerView(
      sources: [Media(media.toString())],
      onVideoComplete: (_, __) {},
      forceSmallControls: true,
    );

    return Stack(
      children: [
        BlocBuilder<LayoutBloc, LayoutState>(
          builder: (context, state) => switch (state) {
            LayoutPortrait() => playerView,
            LayoutLandscape() => LayoutCard(
                child: playerView,
              ),
          },
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton.filledTonal(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(HugeIcons.strokeRoundedCancel01),
          ),
        ),
      ],
    );
  }
}
