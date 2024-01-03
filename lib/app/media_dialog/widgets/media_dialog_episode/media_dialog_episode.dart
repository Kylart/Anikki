import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_completed.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/episode_timer_countdown.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/domain/domain.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';

part 'media_dialog_episode_cover.dart';
part 'media_dialog_episode_completed.dart';
part 'media_dialog_episode_title.dart';
part 'media_dialog_episode_actions.dart';

class MediaDialogEpisode extends StatelessWidget {
  MediaDialogEpisode({
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

  /// Index of the entry in its respective [LibraryEntry]
  final int index;

  /// [Media] for this episode
  final Media? media;

  /// [LibraryEntry] if any
  final LibraryEntry? entry;

  /// Specific [LocalFile] for this episode. Useful for non-numbered episodes (movies, OVAs)
  late final LocalFile? file;

  Fragment$shortMedia$streamingEpisodes? get info {
    final episodes = media?.anilistInfo.streamingEpisodes;
    if (episodes == null) return null;

    var reversed = true;

    /// Sometimes episodes are in reversed orders and sometimes not so this is to try
    /// and guess it the list is ordered or not
    if (episodes.length > 1) {
      final first = episodes.first!;
      final second = episodes.elementAt(1)!;

      if (first.title != null && second.title != null) {
        reversed = (int.tryParse(first.title!.split(' ')[1]) ?? 1) >
            (int.tryParse(second.title!.split(' ')[1]) ?? 0);
      }
    }

    return (reversed ? episodes.reversed : episodes).elementAtOrNull(index - 1);
  }

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
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (LayoutLandscape):
            return LayoutCard(
              child: InkWell(
                onTap: () => aired || file != null ? play(context) : null,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediaDialogEpisodeCover(
                            episodeCover: episodeCover,
                          ),
                          MediaDialogEpisodeTitle(
                            info: info,
                            index: index,
                          ),
                          if (isNextAiringEpisode)
                            EpisodeTimerCountdown(
                              airingAt: nextAiringEpisode!.airingAt,
                            )
                          else if (aired)
                            MediaDialogEpisodeActions(
                              media: media,
                              index: index,
                              entry: entry,
                              localFile: file,
                              info: info,
                              onPlay: play,
                            )
                          else
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Ionicons.ban_outline),
                            ),
                        ],
                      ),
                      if (media != null)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: MediaDialogEpisodeCompleted(
                            media: media!,
                            index: index,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );

          case const (LayoutPortrait):
          default:
            return ListTile(
              leading: episodeCover != null
                  ? Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: (episodeCover == null
                              ? const AssetImage(
                                  'assets/images/cover_placeholder.jpg')
                              : NetworkImage(episodeCover!)) as ImageProvider,
                        ),
                        const Positioned.fill(
                          child: Center(
                            child: EntryTag(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Ionicons.play,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
              title: MediaDialogEpisodeTitle(
                info: info,
                index: index,
                textAlign: TextAlign.start,
              ),
              trailing: aired
                  ? MediaDialogEpisodeActions(
                      media: media,
                      index: index,
                      entry: entry,
                      localFile: file,
                      info: info,
                      mainAxisSize: MainAxisSize.min,
                      onPlay: play,
                    )
                  : Icon(
                      isNextAiringEpisode
                          ? Ionicons.alarm_outline
                          : Ionicons.ban_outline,
                    ),
              subtitle: isNextAiringEpisode
                  ? EpisodeTimerCountdown(
                      airingAt: nextAiringEpisode!.airingAt,
                      textAlign: TextAlign.left,
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (media != null)
                          MediaDialogEpisodeCompleted(
                            media: media!,
                            index: index,
                          ),
                      ],
                    ),
              onTap: () => aired || file != null ? play(context) : null,
            );
        }
      },
    );
  }
}
