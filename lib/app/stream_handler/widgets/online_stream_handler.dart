import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/domain/domain.dart';

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

    BlocProvider.of<StreamHandlerBloc>(context).add(
      StreamHandlerRequested(
        media: widget.state.media,
        minEpisode: widget.state.minEpisode,
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
      builder: (context, state) {
        switch (state.runtimeType) {
          case StreamHandlerError:
            return LayoutCard(
              child: ListTile(
                title: const Text('Something went wrong. Please try again'),
                subtitle: Text((state as StreamHandlerError).error),
              ),
            );
          case StreamHandlerLoading:
          default:
            return LayoutCard(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Retrieving the best videos...'),
                    const SizedBox(
                      height: 12,
                    ),
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 12,
                    ),
                    TextButton(
                      onPressed: () => close(context),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
