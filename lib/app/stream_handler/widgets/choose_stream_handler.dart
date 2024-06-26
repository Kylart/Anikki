import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/app/stream_handler/widgets/choose_stream_button.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/custom_app_icons.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose a streaming method',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settingsState) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        TorrentType.none => throw UnimplementedError(),
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
                        Ionicons.globe_outline,
                        size: 72,
                        color: Color.fromARGB(255, 0, 210, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
