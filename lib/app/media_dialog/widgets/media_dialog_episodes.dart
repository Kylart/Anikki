import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_episode/media_dialog_episode.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

class MediaDialogEpisodes extends StatelessWidget {
  const MediaDialogEpisodes({
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
    const gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 185,
      childAspectRatio: 0.75,
      crossAxisSpacing: 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, state) {
          final hasInfo = media.anilistInfo.id != 0;

          if (state is LayoutLandscape) {
            if (!hasInfo) {
              return GridView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: gridDelegate,
                children: [
                  for (final file in entry?.entries ?? [])
                    MediaDialogEpisode(
                      index: file.episode ?? 0,
                      entry: entry,
                      file: file,
                    ),
                ],
              );
            }

            return GridView.builder(
              itemCount: numberOfEpisodes,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: gridDelegate,
              itemBuilder: (context, index) => MediaDialogEpisode(
                index: numberOfEpisodes - index,
                media: media,
                entry: entry,
                file: entry?.entries.firstWhereOrNull(
                  (e) => e.episode == numberOfEpisodes - index,
                ),
              ),
            );
          } else if (state is LayoutPortrait) {
            if (!hasInfo) {
              return ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (final file in entry?.entries ?? []) ...[
                    MediaDialogEpisode(
                      index: file.episode ?? 0,
                      entry: entry,
                      file: file,
                    ),
                    const Divider(),
                  ],
                ],
              );
            }

            return ListView.separated(
              itemCount: numberOfEpisodes,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => MediaDialogEpisode(
                index: numberOfEpisodes - index,
                media: media,
                entry: entry,
                file: entry?.entries.firstWhereOrNull(
                  (e) => e.episode == numberOfEpisodes - index,
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
