import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/tmdb/models/tmdb_tv_images/backdrop.dart';

part 'home_title_carousel_container.dart';
part 'home_title_carousel_image.dart';

class HomeTitleCarousel extends StatelessWidget {
  const HomeTitleCarousel({
    super.key,
    required this.media,
    required this.minWidth,
  });

  final Media media;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return _HomeTitleCarouselContainer(
      minWidth: minWidth,
      child: Row(
        children: [
          IconButton(
            iconSize: 32,
            onPressed: () {},
            icon: const Icon(HugeIcons.strokeRoundedArrowLeft01),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final (index, backdrop)
                      in media.images!.backdrops!.indexed) ...[
                    _HomeTitleCarouselImage(
                      selected: false,
                      backdrop: backdrop,
                    ),
                    if (index != media.images!.backdrops!.length - 1)
                      const SizedBox(
                        width: 8.0,
                      ),
                  ],
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 32,
            onPressed: () {},
            icon: const Icon(HugeIcons.strokeRoundedArrowRight01),
          ),
        ],
      ),
    );
  }
}
