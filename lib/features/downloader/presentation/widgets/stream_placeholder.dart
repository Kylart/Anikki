import 'dart:io';

import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/library/domain/models/models.dart';
import 'package:anikki/features/torrent/presentation/bloc/torrent_bloc.dart';
import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';

class StreamPlaceholder extends StatefulWidget {
  const StreamPlaceholder({
    super.key,
    required this.magnet,
  });

  final String magnet;

  @override
  State<StreamPlaceholder> createState() => _StreamPlaceholderState();
}

class _StreamPlaceholderState extends State<StreamPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TorrentBloc, TorrentState>(
      listener: (context, state) {
        final torrentBloc = BlocProvider.of<TorrentBloc>(context);
        final watchListBloc = BlocProvider.of<WatchListBloc>(context);
        final scaffold = ScaffoldMessenger.of(context);
        if (state is! TorrentLoaded) return;

        final hash = Uri.parse(widget.magnet).queryParameters['xt'];
        final torrent = state.torrents.firstWhereOrNull(
          (element) => Uri.parse(element.magnet).queryParameters['xt'] == hash,
        );

        if (torrent == null) return;

        final file = File(torrent.path);

        if (!file.existsSync()) return;

        final minProgress = torrentBloc.isTransmission
            ? 0.1
            : torrentBloc.isQBitTorrent
                ? 0.03
                : 1;

        if (torrent.progress < minProgress) return;

        BlocProvider.of<VideoPlayerBloc>(context).add(
          VideoPlayerPlayRequested(
            context: context,
            sources: [torrent.path],
            onVideoComplete: (media) {
              LocalFile.createAndSearchMedia(media.uri).then(
                (file) {
                  watchListBloc.add(
                    WatchListWatched(entry: file, scaffold: scaffold),
                  );

                  torrentBloc.add(
                    TorrentRemoveTorrent(torrent, true),
                  );
                },
              );
            },
          ),
        );

        Navigator.of(context).pop();
      },
      child: LayoutCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Setting up stream, please wait'),
              const SizedBox(
                height: 12,
              ),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {
                  final bloc = BlocProvider.of<TorrentBloc>(context);
                  final state = bloc.state;
                  if (state is! TorrentLoaded) return;

                  final hash = Uri.parse(widget.magnet).queryParameters['xt'];
                  final torrent = state.torrents.firstWhereOrNull(
                    (element) =>
                        Uri.parse(element.magnet).queryParameters['xt'] == hash,
                  );

                  if (torrent != null) {
                    bloc.add(TorrentRemoveTorrent(torrent, true));
                  }

                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
