import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/app/stream_handler/widgets/choose_stream_button.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/custom_app_icons.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ChooseStreamButton(
              title: settingsState.settings.torrentType.title,
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
              child: switch (settingsState.settings.torrentType) {
                TorrentType.transmission => const Icon(
                    CustomIcons.transmission,
                    size: 72,
                    color: Color(0xFFD70008),
                  ),
                TorrentType.qbittorrent => const Icon(
                    CustomIcons.qbittorrent,
                    size: 72,
                    color: Color(0xFF2F67BA),
                  ),
                TorrentType.none => const SizedBox(),
              },
            ),
            ChooseStreamButton(
              title: 'Web hosted',
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
              child: const Icon(
                HugeIcons.strokeRoundedGlobalSearch,
                size: 72,
                color: Color.fromARGB(255, 0, 210, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
