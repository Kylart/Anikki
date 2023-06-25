import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_episode/entry_card_overlay_episode.dart';
import 'package:anikki/features/library/domain/models/models.dart';

class EntryCardOverlayEpisodeLandscape extends StatelessWidget {
  const EntryCardOverlayEpisodeLandscape({
    super.key,
    required this.episodeCover,
    required this.info,
    required this.index,
    required this.isNextAiringEpisode,
    required this.aired,
    required this.media,
    required this.entry,
  });

  final String? episodeCover;
  final Fragment$shortMedia$streamingEpisodes? info;
  final int index;
  final bool isNextAiringEpisode;
  final bool aired;
  final Media media;
  final LibraryEntry? entry;

  @override
  Widget build(BuildContext context) {
    LocalFile? localFile =
        entry?.entries.firstWhereOrNull((element) => element.episode == index);

    if (media.anilistInfo.format == Enum$MediaFormat.MOVIE &&
        entry != null &&
        localFile == null) {
      localFile = entry?.entries.first;
    }

    return LayoutCard(
      child: InkWell(
        onTap: () {
          if (localFile == null) return;

          BlocProvider.of<VideoPlayerBloc>(context).add(
            VideoPlayerPlayRequested(
              context: context,
              sources: entry!.entries.map((e) => e.path).toList(),
              first: localFile,
              onVideoComplete: (media) {
                updateEntry(context, localFile!);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EntryCardOverlayEpisodeCover(
                    episodeCover: episodeCover,
                  ),
                  EntryCardOverlayEpisodeTitle(
                    info: info,
                    index: index,
                  ),
                  if (isNextAiringEpisode)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.next_plan_outlined),
                    )
                  else if (aired)
                    EntryCardOverlayEpisodeActions(
                      media: media,
                      index: index,
                      entry: entry,
                      localFile: localFile,
                      info: info,
                    )
                  else
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.unpublished_outlined),
                    ),
                ],
              ),
              Positioned(
                top: 5,
                right: 5,
                child: EntryCardOverlayEpisodeCompleted(
                  media: media,
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
