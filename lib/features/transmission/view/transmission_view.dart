import 'package:anikki/features/torrent/domain/models/torrent_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/transmission/bloc/transmission_bloc.dart';
import 'package:anikki/core/widgets/torrent_app_bar.dart';
import 'package:anikki/features/transmission/widgets/transmission_torrent_tile.dart';
import 'package:anikki/features/layouts/landscape/layout_card.dart';

class TransmissionView extends StatelessWidget {
  const TransmissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransmissionBloc, TransmissionState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case TransmissionLoaded:
            final currentState = state as TransmissionLoaded;

            return LayoutCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TorrentAppBar(
                    type: TorrentType.transmission,
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

                          return TransmissionTorrentTile(torrent: torrent);
                        },
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                            ),
                        itemCount: currentState.torrents.length),
                  )
                ],
              ),
            );

          case TransmissionEmpty:
          case TransmissionInitial:
          default:
            return const SizedBox();
        }
      },
    );
  }
}
