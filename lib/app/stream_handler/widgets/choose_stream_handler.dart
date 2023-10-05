import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class ChooseStreamHandler extends StatelessWidget {
  const ChooseStreamHandler({
    super.key,
    required this.state,
  });

  final StreamHandlerShowed state;

  void close(BuildContext context) {
    BlocProvider.of<StreamHandlerBloc>(context).add(
      StreamHandlerCloseRequested(
        media: state.media,
        minEpisode: state.minEpisode,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutCard(
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text(
                'Choose streaming method',
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Torrent',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                BlocProvider.of<DownloaderBloc>(context).add(
                  DownloaderRequested(
                    media: state.media,
                    entry: state.entry,
                    episode: state.minEpisode,
                    isStreaming: true,
                  ),
                );
                close(context);
              },
            ),
            ListTile(
              title: const Text(
                'Online',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                close(context);
                BlocProvider.of<StreamHandlerBloc>(context).add(
                  StreamHandlerShowRequested(
                    media: state.media,
                    minEpisode: state.minEpisode,
                    type: StreamRequestType.online,
                  ),
                );
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => close(context),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
