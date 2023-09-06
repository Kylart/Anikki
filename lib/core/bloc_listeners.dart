import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/downloader/helpers/show_downloader.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';

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
