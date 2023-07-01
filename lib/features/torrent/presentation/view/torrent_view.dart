import 'package:anikki/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/torrent/presentation/bloc/torrent_bloc.dart';
import 'package:anikki/features/torrent/presentation/widgets/torrent_app_bar.dart';
import 'package:anikki/features/torrent/presentation/widgets/torrent_cannot_load.dart';
import 'package:anikki/features/torrent/presentation/widgets/torrent_tile.dart';

class TorrentView extends StatefulWidget {
  const TorrentView({super.key});

  @override
  State<TorrentView> createState() => _TorrentViewState();
}

class _TorrentViewState extends State<TorrentView> {
  bool dismissed = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsStage) {
        final settings = settingsStage.settings;

        BlocProvider.of<TorrentBloc>(context).add(
          TorrentSettingsUpdated(
            transmissionSettings:
                settings.torrentType == TorrentType.transmission
                    ? settings.transmissionSettings
                    : null,
            qBitTorrentSettings: settings.torrentType == TorrentType.qbittorrent
                ? settings.qBitTorrentSettings
                : null,
          ),
        );
        return BlocBuilder<TorrentBloc, TorrentState>(
          builder: (context, state) {
            final torrentType = settings.torrentType;

            switch (state.runtimeType) {
              case TorrentLoaded:
                final currentState = state as TorrentLoaded;

                return LayoutCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TorrentAppBar(
                        type: torrentType,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final torrent =
                                currentState.torrents.elementAt(index);

                            return TorrentTile(torrent: torrent);
                          },
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                          ),
                          itemCount: currentState.torrents.length,
                        ),
                      )
                    ],
                  ),
                );

              case TorrentCannotLoad:
                return TorrentCannotLoadWidget(type: torrentType);

              case TorrentEmpty:
              case TorrentInitial:
              default:
                return const SizedBox();
            }
          },
        );
      },
    );
  }
}
