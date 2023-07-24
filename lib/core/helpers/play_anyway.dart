import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';

void playAnyway({
  required BuildContext context,
  Fragment$shortMedia? media,
  LibraryEntry? entry,
  int? episode,
}) {
  final videoBloc = BlocProvider.of<VideoPlayerBloc>(context);
  final library = BlocProvider.of<LibraryBloc>(context).state;
  final watchList = BlocProvider.of<WatchListBloc>(context).state;

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
      ? library.entries.fold<List<String>>(
          [],
          (previousValue, element) => [
            ...previousValue,

            /// Taking `reversed` because the entries of a `LibraryEntry` are sorted descendingly
            /// and we want the next eposide to be the (N + 1)th.
            ...element.entries.reversed.map((e) => e.path),
          ],
        )
      : entry?.entries.reversed.map((e) => e.path);

  final watchListEntry = watchList is WatchListComplete
      ? watchList.current
          .firstWhereOrNull((element) => element.media?.id == media?.id)
      : null;

  if (watchListEntry != null) {
    progress ??= watchListEntry.progress;
  }

  file = entry?.entries
      .firstWhereOrNull((element) => element.episode == (progress ?? 0) + 1);

  if (media?.format == Enum$MediaFormat.MOVIE) {
    file = entry?.entries.first;
  }

  if (file != null) {
    final watchListBloc = BlocProvider.of<WatchListBloc>(context);
    final scaffold = ScaffoldMessenger.of(context);

    videoBloc.add(
      VideoPlayerPlayRequested(
        context: context,
        first: file,
        sources: playlist?.toList() ?? [],
        onVideoComplete: (mkMedia) {
          if (media == null) return;

          final entry = LocalFile(
            path: mkMedia.uri,
            media: Media(anilistInfo: media),
          );

          watchListBloc.add(
            WatchListWatched(
              entry: entry,
              scaffold: scaffold,
            ),
          );
        },
      ),
    );

    return;
  }

  /// Could not find any file on disk for this entry.
  /// Opening stream window
  BlocProvider.of<DownloaderBloc>(context).add(
    DownloaderRequested(
      media: media,
      episode: progress != null ? progress + 1 : null,
      entry: entry,
      isStreaming: true,
    ),
  );
}
