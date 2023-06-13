import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/qbittorrent/presentation/bloc/qbittorrent_bloc.dart';
import 'package:anikki/features/qbittorrent/presentation/widgets/qbittorrent_torrent_tile.dart';
import 'package:anikki/features/torrent/domain/models/models.dart';
import 'package:anikki/features/layouts/presentation/widgets/landscape/layout_card.dart';
import 'package:anikki/core/widgets/torrent_app_bar.dart';

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
