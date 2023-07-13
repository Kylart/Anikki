import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/layouts/presentation/bloc/layout_bloc.dart';
import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';
import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/features/news/presentation/bloc/news_bloc.dart';
import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';
import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';
import 'package:anikki/features/torrent/domain/domain.dart';
import 'package:anikki/features/torrent/presentation/bloc/torrent_bloc.dart';

class AnikkiBlocProvider extends StatelessWidget {
  const AnikkiBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final anilist = Anilist(client: getAnilistClient());
    final nyaa = Nyaa();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AnilistAuthBloc(anilist)..add(AnilistAuthLoginRequested()),
        ),
        BlocProvider(
          create: (context) => LayoutBloc(),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider(
          create: (context) => ConnectivityBloc(),
        ),
        BlocProvider(
          create: (context) => EntryCardOverlayBloc(),
        ),
        BlocProvider(
          create: (context) => DownloaderBloc(nyaa),
        ),
        BlocProvider(
          create: (context) => VideoPlayerBloc(),
        ),
        BlocProvider(
          create: (context) => WatchListBloc(anilist),
        ),
        BlocProvider(
          create: (context) {
            return NewsBloc(anilist: anilist)
              ..add(
                NewsRequested(range: NewsBloc.initalDateRange),
              );
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final settingsBloc = BlocProvider.of<SettingsBloc>(context);
              return LibraryBloc()
                ..add(
                  LibraryUpdateRequested(
                    path: settingsBloc.state.settings.localDirectory,
                  ),
                );
            },
          ),
          BlocProvider(
            create: (context) {
              final settingsBloc = BlocProvider.of<SettingsBloc>(context);
              final settings = settingsBloc.state.settings;

              return TorrentBloc(EmptyRepository())
                ..add(
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
            },
          ),
        ],
        child: BlocListener<AnilistAuthBloc, AnilistAuthState>(
          listener: (context, state) {
            final connected = state is AnilistAuthSuccess;

            BlocProvider.of<WatchListBloc>(context).add(
              WatchListAuthUpdated(
                connected: connected,
                username: connected ? state.me.name : null,
              ),
            );
          },
          child: child,
        ),
      ),
    );
  }
}
