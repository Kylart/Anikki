import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/layouts/landscape/layout_card.dart';
import 'package:anikki/widgets/error_tile.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/features/torrent/helpers/torrent_type.dart';
import 'package:anikki/features/transmission/view/transmission_page.dart';

class TorrentView extends StatelessWidget {
  const TorrentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final torrentType = state.settings.torrentType;

        if (torrentType == TorrentType.none) return const SizedBox();

        return BlocBuilder<TorrentBloc, TorrentState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case TorrentLoading:
                return const CircularProgressIndicator();

              case TorrentLoaded:
                if (torrentType == TorrentType.transmission) {
                  return TransmissionPage(
                    wrapper: (state as TorrentLoaded).transmissionWrapper!,
                  );
                } else {
                  return const ErrorTile(
                    title: 'QBitTorrent is not implemented yet',
                  );
                }

              case TorrentNotFound:
                return LayoutCard(
                  child: ListTile(
                    dense: true,
                    title:
                        Text('Could not find ${torrentType.title()} instance'),
                    subtitle: Text(
                      'Are you sure your ${torrentType.title()} is running and accepting connections?',
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
