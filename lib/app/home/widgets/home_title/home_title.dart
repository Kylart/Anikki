import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return _HomeTitleContainer(
      maxSize: maxSize,
      media: media,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            media.title ?? 'N/A',
            style: context.textTheme.headlineLarge,
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
    );
  }
}
