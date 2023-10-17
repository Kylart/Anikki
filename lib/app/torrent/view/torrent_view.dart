import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/app/torrent/widgets/torrent_cannot_load.dart';
import 'package:anikki/app/torrent/widgets/torrent_tile.dart';

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
      builder: (context, settingsState) {
        final settings = settingsState.settings;

        return LayoutCard(
          child: Column(
            children: [
              AppBar(
                title: Text(settingsState.settings.torrentType.title),
              ),
              BlocBuilder<TorrentBloc, TorrentState>(
                builder: (context, state) {
                  final torrentType = settings.torrentType;

                  switch (state.runtimeType) {
                    case TorrentLoaded:
                      final currentState = state as TorrentLoaded;

                      return ListView.separated(
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
                      );

                    case TorrentCannotLoad:
                      return TorrentCannotLoadWidget(type: torrentType);

                    case TorrentEmpty:
                    case TorrentInitial:
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
