import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:path/path.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/home/widgets/landscape/favourite_button.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/helpers/anilist/anilist_utils.dart';
import 'package:anikki/core/helpers/notify.dart';
import 'package:anikki/core/widgets/empty_widget.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/paginated.dart';
import 'package:anikki/core/widgets/trailer_video_player.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'drawer_action_button.dart';
part 'drawer_banner_image.dart';
part 'drawer_description.dart';
part 'drawer_episode.dart';
part 'drawer_episode_completed.dart';
part 'drawer_episode_delete_button.dart';
part 'drawer_episodes.dart';
part 'drawer_genres.dart';
part 'drawer_image.dart';
part 'drawer_link.dart';
part 'drawer_title.dart';

const _horizontalPadding = 64.0;

enum DrawerActionType {
  full,
  icon,
}

class DrawerAction {
  DrawerAction({
    required this.onPressed,
    required this.label,
    required this.icon,
    this.type = DrawerActionType.icon,
  });

  final void Function(BuildContext context) onPressed;
  final String label;
  final IconData icon;
  final DrawerActionType type;
}

List<DrawerAction> _buildLinks(Media? media) => [
      if (media?.anilistInfo.id != null && media?.anilistInfo.id != 0)
        DrawerAction(
          onPressed: (context) => openInBrowser(
            'https://anilist.co/anime/${media!.anilistInfo.id}',
          ),
          label: 'See on AniList',
          icon: SimpleIcons.anilist,
        ),
      if (media?.anilistInfo.idMal != null)
        DrawerAction(
          onPressed: (context) => openInBrowser(
            'https://myanimelist.net/anime/${media!.anilistInfo.idMal}',
          ),
          label: 'See on MyAnimeList',
          icon: SimpleIcons.myanimelist,
        ),
      if (media?.tmdbInfo?.id != null)
        DrawerAction(
          onPressed: (context) => openInBrowser(
            'https://www.themoviedb.org/tv/${media!.tmdbInfo?.id}',
          ),
          label: 'See on TMDB',
          icon: SimpleIcons.themoviedatabase,
        ),
    ];

List<DrawerAction> _buildActions({
  Media? media,
  LibraryEntry? libraryEntry,
}) =>
    [
      DrawerAction(
        onPressed: (context) {
          final trailerSite = media?.anilistInfo.trailer?.site;
          final trailerSiteId = media?.anilistInfo.trailer?.id;

          if (trailerSiteId == null || trailerSite == null) {
            return context.notify(
              message: 'No trailer available',
              isError: true,
            );
          }

          showAdaptiveDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => Dialog(
              child: TrailerVideoPlayer(
                url: 'https://www.$trailerSite.com/watch?v=$trailerSiteId',
              ),
            ),
          );
        },
        label: 'Watch trailer',
        icon: HugeIcons.strokeRoundedVideoReplay,
      ),
      DrawerAction(
        onPressed: (context) {},
        label: 'Update list entry',
        icon: HugeIcons.strokeRoundedTaskEdit01,
      ),
      DrawerAction(
        onPressed: (context) => BlocProvider.of<DownloaderBloc>(context).add(
          DownloaderRequested(
            media: media?.anilistInfo,
            entry: libraryEntry,
          ),
        ),
        label: 'Download',
        icon: HugeIcons.strokeRoundedDownload04,
      ),
      DrawerAction(
        type: DrawerActionType.full,
        onPressed: (context) => VideoPlayerRepository.playAnyway(
          context: context,
          media: media?.anilistInfo,
        ),
        label: 'Watch',
        icon: HugeIcons.strokeRoundedPlay,
      ),
    ];

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isConnected = BlocProvider.of<AnilistAuthBloc>(
      context,
      listen: true,
    ).isConnected;

    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, watchListState) {
        return BlocBuilder<LayoutBloc, LayoutState>(
          builder: (context, state) {
            /// This can happen on touch screen if the user drags the screen on the right
            if (state.drawerMedia == null && state.drawerLibraryEntry == null) {
              return Center(
                child: EmptyWidget(
                  subtitle: 'Select any media to see more details here.',
                ),
              );
            }

            final watchListEntry = AnilistUtils.getWatchListEntry(
              watchListState.watchList,
              state.drawerMedia!,
            );
            final isInWatchList = watchListEntry != null;

            final libraryEntry = state.drawerLibraryEntry;
            final drawerMedia = state.drawerMedia?.copyWith(
              anilistInfo: watchListEntry?.media,
            );

            if ((drawerMedia == null || drawerMedia.anilistInfo.id == 0) &&
                libraryEntry != null) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _horizontalPadding,
                      vertical: _horizontalPadding / 2,
                    ),
                    child: DrawerTitle(
                      isConnected: isConnected,
                      libraryEntry: libraryEntry,
                    ),
                  ),
                  DrawerEpisodes(
                    libraryEntry: libraryEntry,
                  ),
                ],
              );
            }

            return FutureBuilder<Media>(
                future: tmdb.hydrateMediaWithTmdb(drawerMedia!),
                builder: (context, snapshot) {
                  final media = snapshot.data ?? drawerMedia;

                  return Stack(
                    children: [
                      DrawerBannerImage(media: media),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: _horizontalPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: _horizontalPadding,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                DrawerImage(media: media),
                                Expanded(
                                  child: DrawerTitle(
                                    media: media,
                                    libraryEntry: libraryEntry,
                                    isConnected: isConnected,
                                    isInWatchList: isInWatchList,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: _horizontalPadding,
                              right: _horizontalPadding,
                              bottom: 4.0,
                            ),
                            child: Row(
                              children: [
                                for (final (index, link)
                                    in _buildLinks(media).indexed) ...[
                                  if (index != 0)
                                    const SizedBox(
                                      width: 24.0,
                                    ),
                                  DrawerLink(
                                    link: link,
                                    media: media,
                                  ),
                                ],
                                const Spacer(),
                                for (final action in _buildActions(
                                  media: media,
                                  libraryEntry: libraryEntry,
                                ))
                                  DrawerActionButton(
                                    action: action,
                                    media: media,
                                  )
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  DrawerGenres(media: media),
                                  DrawerDescription(media: media),
                                  DrawerEpisodes(
                                    media: media,
                                    libraryEntry: libraryEntry,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          },
        );
      },
    );
  }
}
