import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_episode/media_details_episode.dart';

class MediaDetailsEpisodes extends StatelessWidget {
  const MediaDetailsEpisodes({
    super.key,
    required this.media,
    this.entry,
  });

  final Media media;
  final LibraryEntry? entry;

  int get numberOfEpisodes => max(
        media.numberOfEpisodes ?? 0,
        entry?.epMax ?? 0,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, state) {
          final hasInfo = media.anilistInfo.id != 0;

          if (!hasInfo) {
            return ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                for (final file in entry?.entries ?? []) ...[
                  MediaDetailsEpisode(
                    index: file.episode ?? 0,
                    entry: entry,
                    file: file,
                  ),
                  const Divider(),
                ],
              ],
            );
          }

          return AnimationLimiter(
            child: ListView.separated(
              itemCount: numberOfEpisodes,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredList(
                position: index,
                child: FadeInAnimation(
                  child: SlideAnimation(
                    child: MediaDetailsEpisode(
                      index: numberOfEpisodes - index,
                      media: media,
                      entry: entry,
                      file: entry?.entries.firstWhereOrNull(
                        (e) => e.episode == numberOfEpisodes - index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
