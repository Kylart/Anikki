import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/app/stream_handler/widgets/choose_stream_handler.dart';
import 'package:anikki/app/stream_handler/widgets/online_stream_handler.dart';
import 'package:anikki/app/stream_handler/widgets/torrent_stream_handler.dart';
import 'package:anikki/core/core.dart';

class StreamHandlerView extends StatefulWidget {
  const StreamHandlerView({
    super.key,
    required this.state,
  });

  final StreamHandlerShowed state;

  @override
  State<StreamHandlerView> createState() => _StreamHandlerViewState();
}

class _StreamHandlerViewState extends State<StreamHandlerView> {
  void close(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final type = widget.state.type ??
        BlocProvider.of<SettingsBloc>(context)
            .state
            .settings
            .streamSettings
            .streamRequestType;

    switch (type) {
      case StreamRequestType.torrent:
        return TorrentStreamHandler(
          state: widget.state,
        );
      case StreamRequestType.online:
        return OnlineStreamHandler(
          state: widget.state,
        );
      case StreamRequestType.choose:
      default:
        return ChooseStreamHandler(
          state: widget.state,
        );
    }
  }
}
