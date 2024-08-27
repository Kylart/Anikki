import 'dart:math';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/home/widgets/home_title/home_title_carousel/home_title_carousel.dart';
import 'package:anikki/app/media_details/widgets/media_details_video_player.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

part 'home_title_actions.dart';
part 'home_title_container.dart';
part 'home_title_subtitle.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.media,
    required this.maxSize,
  });

  final Media media;

  final Size maxSize;
  double get minWidth => 635.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topLeft,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...previousChildren.map(
                  (e) => Flexible(child: e),
                )
              ],
            ),
            if (currentChild != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: currentChild),
                ],
              ),
          ],
        );
      },
      child: Column(
        key: ValueKey(media),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HomeTitleContainer(
            maxSize: maxSize,
            minWidth: minWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  media.title ?? 'N/A',
                  style: context.textTheme.headlineLarge,
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0,
                  ),
                  child: _HomeTitleSubtitle(
                    media: media,
                  ),
                ),
                _HomeTitleActions(
                  media: media,
                ),
              ],
            ),
          ),
          if (media.images?.backdrops?.isNotEmpty == true &&
              media.images!.backdrops!.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: HomeTitleCarousel(
                media: media,
                minWidth: minWidth,
              ),
            ),
        ],
      ),
    );
  }
}
