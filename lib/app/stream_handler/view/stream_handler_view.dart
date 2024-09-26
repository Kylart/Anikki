import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/app/stream_handler/widgets/choose_stream_handler.dart';
import 'package:anikki/app/stream_handler/widgets/online_stream_handler.dart';
import 'package:anikki/app/stream_handler/widgets/torrent_stream_handler.dart';
import 'package:anikki/core/core.dart';

class StreamHandlerView extends StatelessWidget {
  const StreamHandlerView({
    super.key,
    required this.state,
  });

  final StreamHandlerShowed state;

  @override
  Widget build(BuildContext context) {
    final type = state.type ??
        BlocProvider.of<SettingsBloc>(context)
            .state
            .settings
            .streamSettings
            .streamRequestType;

    return switch (type) {
      StreamRequestType.torrent => TorrentStreamHandler(
          state: state,
        ),
      StreamRequestType.online => OnlineStreamHandler(
          state: state,
        ),
      StreamRequestType.choose => ChooseStreamHandler(
          state: state,
        ),
    };
  }
}
