import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/qbittorrent/bloc/qbittorrent_bloc.dart';
import 'package:anikki/features/qbittorrent/widgets/qbittorrent_torrent_tile.dart';
import 'package:anikki/features/torrent/helpers/torrent_type.dart';
import 'package:anikki/layouts/landscape/layout_card.dart';
import 'package:anikki/widgets/torrent_app_bar.dart';

class QBitTorrentView extends StatelessWidget {
  const QBitTorrentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QBitTorrentBloc, QBitTorrentState>(
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

          case QBitTorrentEmpty:
          case QBitTorrentInitial:
          default:
            return const SizedBox();
        }
      },
    );
  }
}
