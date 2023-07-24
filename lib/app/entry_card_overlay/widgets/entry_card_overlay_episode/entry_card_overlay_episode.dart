import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_completed.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';

part 'entry_card_overlay_episode_cover.dart';
part 'entry_card_overlay_episode_completed.dart';
part 'entry_card_overlay_episode_title.dart';
part 'entry_card_overlay_episode_actions.dart';
part 'entry_card_overlay_episode_portrait.dart';
part 'entry_card_overlay_episode_landscape.dart';

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
