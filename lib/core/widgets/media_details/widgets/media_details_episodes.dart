import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_episode/media_details_episode.dart';
import 'package:anikki/core/widgets/paginated.dart';

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
    return BlocBuilder<LayoutBloc, LayoutState>(
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

        final maxPage = (numberOfEpisodes / kPaginatedPerPage).ceil();
        final initialPage = media.anilistInfo.nextAiringEpisode?.episode != null
            ? maxPage -
                ((media.anilistInfo.nextAiringEpisode!.episode - 1) /
                        kPaginatedPerPage)
                    .ceil() -
                1
            : 0;

        return Paginated(
          numberOfEntries: numberOfEpisodes,
          initialPage: max(initialPage, 0),
          pageBuilder: (context, page) {
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: kPaginatedPerPage,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final currentIndex =
                      numberOfEpisodes - index - (page * kPaginatedPerPage);

                  if (currentIndex < 1) return const SizedBox();

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        child: Column(
                          children: [
                            MediaDetailsEpisode(
                              index: currentIndex,
                              media: media,
                              entry: entry,
                              file: entry?.entries.firstWhereOrNull(
                                (e) => e.episode == currentIndex,
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
