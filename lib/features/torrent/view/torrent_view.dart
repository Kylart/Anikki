import 'package:anikki/features/qbittorrent/view/qbittorrent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/layouts/landscape/layout_card.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/features/torrent/helpers/torrent_type.dart';
import 'package:anikki/features/transmission/view/transmission_page.dart';

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
      builder: (context, state) {
        final torrentType = state.settings.torrentType;

        if (torrentType == TorrentType.none) return const SizedBox();

        return BlocBuilder<TorrentBloc, TorrentState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case TorrentLoaded:
                final currentState = state as TorrentLoaded;

                if (torrentType == TorrentType.transmission &&
                    currentState.transmissionWrapper != null) {
                  return TransmissionPage(
                    wrapper: currentState.transmissionWrapper!,
                  );
                } else if (torrentType == TorrentType.qbittorrent &&
                    currentState.qBitTorrentWrapper != null) {
                  return QBitTorrentPage(
                    wrapper: currentState.qBitTorrentWrapper!,
                  );
                }

                return const SizedBox();

              case TorrentLoading:
              case TorrentNotFound:
                if (dismissed) return const SizedBox();

                return LayoutCard(
                  child: ListTile(
                    dense: true,
                    title:
                        Text('Could not find ${torrentType.title()} instance'),
                    subtitle: Text(
                      'Are you sure your ${torrentType.title()} is running and accepting connections?',
                    ),
                    trailing: IconButton(
                      onPressed: () => setState(() {
                        dismissed = true;
                      }),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                );

              case TorrentInitial:
              default:
                return const Text('Not instanciated.');
            }
          },
        );
      },
    );
  }
}
