import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_video_player.dart';
import 'package:flutter/material.dart';

class EntryCardOverlayTrailer extends StatefulWidget {
  const EntryCardOverlayTrailer({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  State<EntryCardOverlayTrailer> createState() =>
      _EntryCardOverlayTrailerState();
}

class _EntryCardOverlayTrailerState extends State<EntryCardOverlayTrailer> {
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
              Center(
                child: IconButton.filledTonal(
                  onPressed: () => setState(() {
                    showThumbnail = false;
                  }),
                  icon: const Icon(Icons.play_arrow),
                ),
              )
            ],
          )
        : EntryCardOverlayVideoPlayer(
            url: 'https://www.${site!}.com/watch?v=${id!}',
          );
  }
}
