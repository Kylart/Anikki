import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_video_player.dart';

class MediaDetailsTrailer extends StatefulWidget {
  const MediaDetailsTrailer({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  State<MediaDetailsTrailer> createState() => _MediaDetailsTrailerState();
}

class _MediaDetailsTrailerState extends State<MediaDetailsTrailer> {
  String? get thumbnail => widget.media.anilistInfo.trailer?.thumbnail;
  String? get site => widget.media.anilistInfo.trailer?.site;
  String? get id => widget.media.anilistInfo.trailer?.id;

  @override
  Widget build(BuildContext context) {
    if (thumbnail == null || id == null || site != 'youtube') {
      return const SizedBox();
    }

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 600,
      ),
      child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              Positioned.fill(
                child: LayoutCard(
                  child: Image.network(
                    thumbnail!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80.0),
                          child: Text('Could not load thumbnail'),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: IconButton.filledTonal(
                    padding: const EdgeInsets.all(12.0),
                    onPressed: () {
                      showAdaptiveDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => Dialog(
                          child: MediaDetailsVideoPlayer(
                            url: 'https://www.${site!}.com/watch?v=${id!}',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Ionicons.play),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
