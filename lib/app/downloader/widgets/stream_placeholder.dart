import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/domain/domain.dart';

class StreamPlaceholder extends StatefulWidget {
  const StreamPlaceholder({
    super.key,
    required this.magnet,
    this.media,
  });

  final String magnet;
  final Media? media;

  @override
  State<StreamPlaceholder> createState() => _StreamPlaceholderState();
}

class _StreamPlaceholderState extends State<StreamPlaceholder> {
  void onTorrentBlocChange(BuildContext context, TorrentState state) {
    final torrentBloc = BlocProvider.of<TorrentBloc>(context);

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

    VideoPlayerRepository.playFile(
      context: context,
      playlist: [
        convertToMkMedia(
          LocalFile(
            path: torrent.path,
            media: widget.media,
          ),
        ),
      ],
      torrent: torrent,
      media: widget.media,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TorrentBloc, TorrentState>(
      listener: onTorrentBlocChange,
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
