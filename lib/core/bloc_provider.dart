import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/features/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home/features/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/home/features/home_timelines/bloc/home_timelines_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/search/bloc/search_bloc.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/stream_handler/bloc/stream_handler_bloc.dart';
import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

class AnikkiBlocProvider extends StatelessWidget {
  const AnikkiBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final anilist = Anilist(client: getAnilistClient());
    final nyaa = Nyaa();
    final files = Files();

    final localStorageRepository = LocalStorageRepository(anilist, files);
    final animeSearchRepository = AnimeInformationRepository(anilist, nyaa);
    final torrentSearchRepository = TorrentSearchRepository(nyaa);
    final userListRepository = UserListRepository(anilist);
    final userRepository = UserRepository(anilist);
    const videoPlayerRepository = VideoPlayerRepository();
    final feedRepository = FeedRepository(anilist);
    final consumetRepository = ConsumetRepository();
    final userInformationRepository = UserInformationRepository(anilist);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AnilistAuthBloc(userRepository)..add(AnilistAuthLoginRequested()),
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
          create: (context) => DownloaderBloc(torrentSearchRepository),
        ),
        BlocProvider(
          create: (context) => StreamHandlerBloc(consumetRepository),
        ),
        BlocProvider(
          create: (context) => VideoPlayerBloc(videoPlayerRepository),
        ),
        BlocProvider(
          create: (context) => WatchListBloc(userListRepository),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => HomeContinueBloc(userListRepository),
        ),
        BlocProvider(
          create: (context) => HomeTimelinesBloc(
            feedRepository: feedRepository,
            userInformationRepository: userInformationRepository,
          ),
        ),
        BlocProvider(
          create: (context) => HomeStartBloc(
            userListRepository: userListRepository,
            feedRepository: feedRepository,
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(animeSearchRepository),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final settingsBloc = BlocProvider.of<SettingsBloc>(context);
              return LibraryBloc(localStorageRepository)
                ..add(
                  LibraryUpdateRequested(
                    path: settingsBloc.state.settings.librarySettings.path,
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
        child: child,
      ),
    );
  }
}
