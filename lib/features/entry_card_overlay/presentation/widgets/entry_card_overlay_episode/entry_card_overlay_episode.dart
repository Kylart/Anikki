import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_completed.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';
import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:anikki/features/library/domain/models/models.dart';

part 'entry_card_overlay_episode_cover.dart';
part 'entry_card_overlay_episode_completed.dart';
part 'entry_card_overlay_episode_title.dart';
part 'entry_card_overlay_episode_actions.dart';

class EntryCardOverlayEpisode extends StatelessWidget {
  const EntryCardOverlayEpisode({
    super.key,
    required this.index,
    required this.media,
    this.entry,
  });

  final int index;
  final Media media;
  final LibraryEntry? entry;

  @override
  Widget build(BuildContext context) {
    final info = media.anilistInfo.streamingEpisodes?.firstWhereOrNull(
      (element) =>
          element?.title != null &&
          element!.title!.startsWith('Episode $index'),
    );
    final episodeCover = info?.thumbnail ?? media.coverImage;

    final nextAiringEpisode = media.anilistInfo.nextAiringEpisode;
    final aired = index <= (nextAiringEpisode?.episode ?? double.infinity);
    final isNextAiringEpisode =
        nextAiringEpisode != null && nextAiringEpisode.episode == index;

    return LayoutCard(
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
                    info: info,
                  )
                else
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.unpublished_outlined),
                  ),
              ],
            ),
            EntryCardOverlayEpisodeCompleted(
              media: media,
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
