import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/core/widgets/loading_widget.dart';
import 'package:anikki/domain/video_player_repository.dart';

class OnlineStreamHandler extends StatefulWidget {
  const OnlineStreamHandler({
    super.key,
    required this.state,
  });

  final StreamHandlerShowed state;

  @override
  State<OnlineStreamHandler> createState() => _OnlineStreamHandlerState();
}

class _OnlineStreamHandlerState extends State<OnlineStreamHandler> {
  @override
  void initState() {
    super.initState();

    final settings =
        BlocProvider.of<SettingsBloc>(context).state.settings.streamSettings;

    BlocProvider.of<StreamHandlerBloc>(context).add(
      StreamHandlerRequested(
        media: widget.state.media,
        minEpisode: widget.state.minEpisode,
        videoType: settings.videoType,
      ),
    );
  }

  void close(BuildContext context) {
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
    return BlocConsumer<StreamHandlerBloc, StreamHandlerState>(
      listener: (context, state) {
        if (state is! StreamHandlerSuccess) return;

        close(context);

        VideoPlayerRepository.startOnlinePlay(
          context: context,
          playlist: state.sources.map((e) => e.media).toList(),
          media: Media(anilistInfo: state.media),
        );
      },
      builder: (context, state) => LayoutCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: switch (state) {
            StreamHandlerError() => CustomErrorWidget(
                height: 275,
                title: 'Something went wrong, please try again later.',
                description: state.error,
              ),
            _ => const LoadingWidget(
                title: 'Retrieving the best videos...',
                height: 275,
              ),
          },
        ),
      ),
    );
  }
}
