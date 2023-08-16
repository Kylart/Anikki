import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_video_player.dart';

class MediaDialogTrailer extends StatefulWidget {
  const MediaDialogTrailer({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  State<MediaDialogTrailer> createState() => _MediaDialogTrailerState();
}

class _MediaDialogTrailerState extends State<MediaDialogTrailer> {
  String? get thumbnail => widget.media.anilistInfo.trailer?.thumbnail;
  String? get site => widget.media.anilistInfo.trailer?.site;
  String? get id => widget.media.anilistInfo.trailer?.id;

  bool showThumbnail = true;

  @override
  Widget build(BuildContext context) {
    if (thumbnail == null || id == null || site != 'youtube') {
      return const SizedBox();
    }

    return showThumbnail
        ? Stack(
            children: [
              Center(
                child: LayoutCard(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      thumbnail!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: IconButton.filledTonal(
                    onPressed: () => setState(() {
                      showThumbnail = false;
                    }),
                    icon: const Icon(Icons.play_arrow),
                  ),
                ),
              )
            ],
          )
        : MediaDialogVideoPlayer(
            url: 'https://www.${site!}.com/watch?v=${id!}',
          );
  }
}
