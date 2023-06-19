import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/torrent/presentation/shared/widgets/torrent_app_bar.dart';
import 'package:anikki/features/torrent/presentation/shared/widgets/torrent_cannot_load.dart';
import 'package:anikki/features/qbittorrent/presentation/bloc/qbittorrent_bloc.dart';
import 'package:anikki/features/qbittorrent/presentation/widgets/qbittorrent_torrent_tile.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';

class QBitTorrentView extends StatelessWidget {
  const QBitTorrentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        BlocProvider.of<QBitTorrentBloc>(context).add(
          QBitTorrentSettingsUpdated(state.settings.qBitTorrentSettings),
        );
      },
      child: BlocBuilder<QBitTorrentBloc, QBitTorrentState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case QBitTorrentLoaded:
              final currentState = state as QBitTorrentLoaded;

              return LayoutCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TorrentAppBar(
                      type: TorrentType.qbittorrent,
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

                            return QBitTorrentTorrentTile(torrent: torrent);
                          },
                          separatorBuilder: (context, index) => const Divider(
                                height: 1,
                              ),
                          itemCount: currentState.torrents.length),
                    )
                  ],
                ),
              );

            case QBitTorrentCannotLoad:
              return const TorrentCannotLoad(type: TorrentType.qbittorrent);

            case QBitTorrentEmpty:
            case QBitTorrentInitial:
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
