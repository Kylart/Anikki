import 'package:anikki/domain/domain.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/home/features/home_timelines/models/models.dart';
import 'package:anikki/core/core.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeTimelineFeedCard extends StatelessWidget {
  const HomeTimelineFeedCard({
    super.key,
    required this.entry,
    required this.description,
  });

  final Widget description;
  final TimelineEntry entry;

  Media get media => entry.media;

  @override
  Widget build(BuildContext context) {
    const tileHeight = 175.0;
    const iconSize = 16.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: tileHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          border: Border.all(
            color: context.colorScheme.outline.withOpacity(0.3),
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 9 / 14,
              child: Image(
                fit: BoxFit.cover,
                image: media.coverImage == null
                    ? const AssetImage(
                        'assets/images/placeholder.jpg',
                      )
                    : CachedNetworkImageProvider(media.coverImage!),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: AutoSizeText(
                      media.title ?? 'N/A',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    subtitle: media.anilistInfo.title?.native == null
                        ? const SizedBox()
                        : AutoSizeText(
                            media.anilistInfo.title!.native!,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                  ),
                  const Divider(),
                  Expanded(
                    child: description,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton.filledTonal(
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          VideoPlayerRepository.playAnyway(
                            context: context,
                            media: entry.media.anilistInfo,
                          );
                        },
                        icon: const Icon(
                          HugeIcons.strokeRoundedPlay,
                          size: iconSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton.outlined(
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            HugeIcons.strokeRoundedMoreHorizontalCircle01,
                            size: iconSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
