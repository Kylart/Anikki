import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/episode_timer_countdown.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'media_details_episode_actions.dart';
part 'media_details_episode_completed.dart';
part 'media_details_episode_cover.dart';
part 'media_details_episode_title.dart';

class MediaDetailsEpisode extends StatelessWidget {
  MediaDetailsEpisode({
    super.key,
    required this.index,
    this.media,
    this.entry,
    LocalFile? file,
  }) {
    if (media?.anilistInfo.format == Enum$MediaFormat.MOVIE &&
        entry != null &&
        file == null) {
      this.file = entry?.entries.first;
    } else {
      this.file = file ??
          entry?.entries
              .firstWhereOrNull((element) => element.episode == index);
    }
  }

  /// Index to use as episode number. If there is any [Media] info available, this will
  /// be the episode number. Otherwise, it will be the index of the [LocalFile] in its
  /// [LibraryEntry].
  /// This index starts at 1 when there is [Media] information, 0 otherwise.
  final int index;

  /// [Media] for this episode
  final Media? media;

  /// [LibraryEntry] if any
  final LibraryEntry? entry;

  /// Specific [LocalFile] for this episode. Useful for non-numbered episodes (movies, OVAs)
  late final LocalFile? file;

  Fragment$shortMedia$streamingEpisodes? get info =>
      media?.anilistInfo.streamingEpisodes?.firstWhereOrNull(
        (element) =>
            element?.title?.split(' - ').firstOrNull == 'Episode $index',
      );

  String? get episodeCover => info?.thumbnail ?? media?.coverImage;

  Fragment$shortMedia$nextAiringEpisode? get nextAiringEpisode =>
      media?.anilistInfo.nextAiringEpisode;

  bool get aired => index < (nextAiringEpisode?.episode ?? double.infinity);

  bool get isNextAiringEpisode => nextAiringEpisode?.episode == index;

  void play(BuildContext context) {
    if (file != null) {
      VideoPlayerRepository.playFile(
        context: context,
        file: file,
        media: media,
      );
    } else {
      VideoPlayerRepository.playAnyway(
        context: context,
        media: media?.anilistInfo,
        entry: entry,
        episode: index,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) => ListTile(
        leading: episodeCover != null
            ? Badge(
                alignment: const Alignment(0.2, -0.9),
                backgroundColor: Colors.transparent,
                label: media != null
                    ? MediaDetailsEpisodeCompleted(
                        media: media!,
                        index: index,
                      )
                    : null,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: (episodeCover == null
                      ? const AssetImage('assets/images/cover_placeholder.jpg')
                      : NetworkImage(episodeCover!)) as ImageProvider,
                ),
              )
            : null,
        title: MediaDetailsEpisodeTitle(
          info: info,
          index: index,
          textAlign: TextAlign.start,
        ),
        trailing: aired
            ? MediaDetailsEpisodeActions(
                media: media,
                index: index,
                entry: entry,
                localFile: file,
                info: info,
                mainAxisSize: MainAxisSize.min,
                onPlay: play,
              )
            : null,
        subtitle: isNextAiringEpisode
            ? EpisodeTimerCountdown(
                airingAt: nextAiringEpisode!.airingAt,
                textAlign: TextAlign.left,
              )
            : null,
        onTap: () => aired || file != null ? play(context) : null,
      ),
    );
  }
}
