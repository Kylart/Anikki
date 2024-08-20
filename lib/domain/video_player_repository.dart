import 'package:anikki/core/helpers/anilist/anilist_utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart' as mk;
import 'package:open_app_file/open_app_file.dart';
import 'package:window_manager/window_manager.dart';

import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/core/core.dart';

/// Repository to handle video player needs
class VideoPlayerRepository {
  const VideoPlayerRepository();

  /// Handles fullscreen events
  void handleFullscreen(bool isFullscreen) {
    if (isFullscreen) {
      if (isDesktop()) {
        windowManager.setFullScreen(false);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
        ]);
      }
    } else {
      if (isDesktop()) {
        windowManager.setFullScreen(true);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
    }
  }

  static void startOnlinePlay({
    required BuildContext context,
    required List<mk.Media> playlist,
    required Media media,
  }) {
    final videoBloc = BlocProvider.of<VideoPlayerBloc>(context);
    final watchListBloc = BlocProvider.of<WatchListBloc>(context);

    videoBloc.add(
      VideoPlayerPlayRequested(
        context: context,
        sources: playlist,
        onVideoComplete: (mkMedia, progress) {
          if (progress < kVideoMinCompletedProgress) return;

          final episode = mkMedia.extras?['episodeNumber'] as int?;

          if (episode == null) return;

          watchListBloc.add(
            WatchListWatched(
              media: media,
              episode: episode,
            ),
          );
        },
      ),
    );
  }

  static void _startFileVideo({
    required BuildContext context,
    required List<mk.Media> playlist,
    LocalFile? file,
    Media? media,
    Torrent? torrent,
  }) {
    final videoBloc = BlocProvider.of<VideoPlayerBloc>(context);
    final watchListBloc = BlocProvider.of<WatchListBloc>(context);
    final torrentBloc = BlocProvider.of<TorrentBloc>(context);

    videoBloc.add(
      VideoPlayerPlayRequested(
        context: context,
        first: file,
        sources: playlist,
        onVideoComplete: (mkMedia, progress) async {
          if (torrent != null) {
            torrentBloc.add(
              TorrentRemoveTorrent(torrent, true),
            );
          }

          if (media == null && file?.media == null) return;
          if (progress < kVideoMinCompletedProgress) return;

          watchListBloc.add(
            WatchListWatched(
              entry: media == null
                  ? await LocalFile.createAndSearchMedia(mkMedia.uri)
                  : LocalFile(
                      path: mkMedia.uri,
                      media: media,
                    ),
            ),
          );
        },
      ),
    );
  }

  static Future<void> playFile({
    required BuildContext context,
    List<mk.Media> playlist = const [],
    LocalFile? file,
    Media? media,
    Torrent? torrent,
  }) async {
    final settings = BlocProvider.of<SettingsBloc>(context)
        .state
        .settings
        .videoPlayerSettings;

    if (!settings.inside) {
      final path = file?.path ?? playlist.first.uri;

      if (file != null) {
        BlocProvider.of<WatchListBloc>(context).add(
          WatchListWatched(
            entry: file,
          ),
        );
      }

      /// We need to escape the brackets because they are not escaped properly
      /// by OpenAppFile.;
      await OpenAppFile.open(
        path.replaceAll('(', '\\(').replaceAll(')', '\\)'),
      );
    } else {
      if (playlist.isEmpty) {
        playlist =
            (BlocProvider.of<LibraryBloc>(context).state as LibraryLoaded)
                .playlist;
      }

      _startFileVideo(
        context: context,
        file: file,
        playlist: playlist,
        media: media,
        torrent: torrent,
      );
    }
  }

  static void playAnyway({
    required BuildContext context,
    Fragment$shortMedia? media,
    LibraryEntry? entry,
    int? episode,
  }) {
    final library = BlocProvider.of<LibraryBloc>(context).state;
    final watchListState = BlocProvider.of<WatchListBloc>(context).state;

    int? progress;
    LocalFile? file;

    if (episode != null) progress = episode - 1;

    /// If no entry is given, try to find one in the library
    if (entry == null && library is LibraryLoaded) {
      entry = library.entries.firstWhereOrNull(
        (element) => element.media?.anilistInfo.id == media?.id,
      );
    }

    final playlist = library is LibraryLoaded
        ? library.playlist
        : entry?.entries.reversed.map(convertToMkMedia).toList();

    final watchListEntry = media != null
        ? AnilistUtils.getCurrentEntry(
            watchListState.watchList,
            Media(anilistInfo: media),
          )
        : null;

    if (watchListEntry != null) {
      progress ??= watchListEntry.progress;
    }

    file = entry?.entries.firstWhereOrNull(
          (element) => element.episode == (progress ?? 0) + 1,
        ) ??
        entry?.entries.firstOrNull;

    if (media?.format == Enum$MediaFormat.MOVIE) {
      file = entry?.entries.first;
    }

    if (file != null) {
      playFile(
        file: file,
        context: context,
        playlist: playlist ?? [convertToMkMedia(file)],
        media: Media(anilistInfo: media),
      );
      return;
    }

    /// Could not find any file on disk for this entry.
    /// Requesting stream
    BlocProvider.of<StreamHandlerBloc>(context).add(
      StreamHandlerShowRequested(
        media: media ??
            AnilistUtils.getEmptyMedia(
              title: entry?.entries.first.title,
            ),
        minEpisode: progress != null ? progress + 1 : null,
        entry: entry,
      ),
    );
  }
}
