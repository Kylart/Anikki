import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/downloader/helpers/show_downloader.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

class BlocListeners extends StatelessWidget {
  const BlocListeners({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SettingsBloc, SettingsState>(
          listener: (context, state) {
            final settings = state.settings;

            /// Torrent listener
            final torrentBloc = BlocProvider.of<TorrentBloc>(context);

            if (torrentBloc.repository is EmptyRepository &&
                    settings.torrentType != TorrentType.none ||
                torrentBloc.repository is TransmissionRepository &&
                    settings.torrentType != TorrentType.transmission ||
                torrentBloc.repository is QBitTorrentRepository &&
                    settings.torrentType != TorrentType.qbittorrent) {
              torrentBloc.add(
                TorrentSettingsUpdated(
                  transmissionSettings:
                      settings.torrentType == TorrentType.transmission
                          ? settings.transmissionSettings
                          : null,
                  qBitTorrentSettings:
                      settings.torrentType == TorrentType.qbittorrent
                          ? settings.qBitTorrentSettings
                          : null,
                ),
              );
            }
          },
        ),
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            if (state is! ConnectivityOnline) return;

            BlocProvider.of<AnilistAuthBloc>(context).add(
              AnilistAuthLoginRequested(),
            );
          },
        ),
        BlocListener<DownloaderBloc, DownloaderState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case DownloaderShow:
                if (!(state as DownloaderShow).alreadyShow) {
                  showDownloader(context, state.term);
                }
                break;

              default:
                return;
            }
          },
        ),
        BlocListener<AnilistAuthBloc, AnilistAuthState>(
          listener: (context, state) {
            final connected = state is AnilistAuthSuccess;

            BlocProvider.of<WatchListBloc>(context).add(
              WatchListAuthUpdated(
                connected: connected,
                username: connected ? state.me.name : null,
              ),
            );

            if (connected) {
              BlocProvider.of<HomeContinueBloc>(context).add(
                HomeContinueRefresh(state.me.name),
              );

              BlocProvider.of<HomeStartBloc>(context).add(
                HomeStartRefresh(state.me.name),
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
