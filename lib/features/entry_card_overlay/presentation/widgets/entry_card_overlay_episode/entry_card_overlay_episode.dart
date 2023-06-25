import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_completed.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_episode/entry_card_overlay_episode_landscape.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_episode/entry_card_overlay_episode_portrait.dart';
import 'package:anikki/features/layouts/presentation/bloc/layout_bloc.dart';
import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
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

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        if (state is LayoutLandscape) {
          return EntryCardOverlayEpisodeLandscape(
            episodeCover: episodeCover,
            info: info,
            index: index,
            isNextAiringEpisode: isNextAiringEpisode,
            aired: aired,
            media: media,
            entry: entry,
          );
        } else if (state is LayoutPortrait) {
          return EntryCardOverlayEpisodePortrait(
            episodeCover: episodeCover,
            info: info,
            index: index,
            isNextAiringEpisode: isNextAiringEpisode,
            aired: aired,
            media: media,
            entry: entry,
          );
        }

        return const SizedBox();
      },
    );
  }
}
