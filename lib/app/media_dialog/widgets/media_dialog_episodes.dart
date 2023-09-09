import 'dart:math';

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
    if (numberOfEpisodes == 0) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, state) {
          if (state is LayoutLandscape) {
            return GridView.builder(
              itemCount: numberOfEpisodes,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 185,
                childAspectRatio: 0.75,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (context, index) => MediaDialogEpisode(
                index: numberOfEpisodes - index,
                media: media,
                entry: entry,
              ),
            );
          } else if (state is LayoutPortrait) {
            return ListView.separated(
              itemCount: numberOfEpisodes,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => MediaDialogEpisode(
                index: numberOfEpisodes - index,
                media: media,
                entry: entry,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
