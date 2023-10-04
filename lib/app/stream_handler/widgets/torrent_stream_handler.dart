import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class TorrentStreamHandler extends StatefulWidget {
  const TorrentStreamHandler({
    super.key,
    required this.state,
  });

  final StreamHandlerShowed state;

  @override
  State<TorrentStreamHandler> createState() => _TorrentStreamHandlerState();
}

class _TorrentStreamHandlerState extends State<TorrentStreamHandler> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<DownloaderBloc>(context).add(
      DownloaderRequested(
        media: widget.state.media,
        entry: widget.state.entry,
        episode: widget.state.minEpisode,
        isStreaming: true,
      ),
    );

    BlocProvider.of<StreamHandlerBloc>(context).add(
      StreamHandlerCloseRequested(
        media: widget.state.media,
        minEpisode: widget.state.minEpisode,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return const LayoutCard(
      child: Text('Setting up torrent...'),
    );
  }
}
