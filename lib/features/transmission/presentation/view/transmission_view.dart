import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/models/torrent_type.dart';
import 'package:anikki/features/torrent/presentation/shared/widgets/torrent_app_bar.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/torrent/presentation/shared/widgets/torrent_cannot_load.dart';
import 'package:anikki/features/transmission/presentation/bloc/transmission_bloc.dart';
import 'package:anikki/features/transmission/presentation/widgets/transmission_torrent_tile.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class TransmissionView extends StatelessWidget {
  const TransmissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        BlocProvider.of<TransmissionBloc>(context).add(
          TransmissionSettingsUpdated(state.settings.transmissionSettings),
        );
      },
      child: BlocBuilder<TransmissionBloc, TransmissionState>(
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

            case TransmissionCannotLoad:
              return const TorrentCannotLoad(type: TorrentType.transmission);

            case TransmissionEmpty:
            case TransmissionInitial:
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
