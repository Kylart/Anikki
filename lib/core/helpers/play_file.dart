import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';

Future<void> playFile(
  LocalFile entry,
  BuildContext context, [
  bool playInside = false,
]) async {
  final watchListBloc = BlocProvider.of<WatchListBloc>(context);
  if (playInside) {
    watchListBloc.add(
      WatchListWatched(
        entry: entry,
        scaffold: ScaffoldMessenger.of(context),
      ),
    );

    /// We need to escape the brackets because they are not escaped properly
    /// by OpenAppFile.;
    await OpenAppFile.open(
        entry.file.path.replaceAll('(', '\\(').replaceAll(')', '\\)'));
  } else {
    final libraryState =
        BlocProvider.of<LibraryBloc>(context).state as LibraryLoaded;

    BlocProvider.of<VideoPlayerBloc>(context).add(
      VideoPlayerPlayRequested(
        context: context,
        sources: libraryState.playlist,
        first: entry,
        onVideoComplete: (media) {
          /// We have to find the `LocalFile` that was just completed
          final entry = libraryState.entries.fold<List<LocalFile>>(
            [],
            (previousValue, element) => [
              ...previousValue,
              ...element.entries.reversed.map((e) => e),
            ],
          ).firstWhere(
              (element) => normalize(element.path) == normalize(media.uri));

          watchListBloc.add(
            WatchListWatched(
              entry: entry,
              scaffold: ScaffoldMessenger.of(context),
            ),
          );
        },
      ),
    );
  }
}
