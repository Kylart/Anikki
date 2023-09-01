import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/home_start/view/home_start_view.dart';

class HomeStartPage extends StatelessWidget {
  const HomeStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchListBloc, WatchListState>(
      listener: (context, state) {
        if (state is WatchListComplete && state.username != null) {
          BlocProvider.of<HomeStartBloc>(context)
              .add(HomeStartRefresh(state.username!));
        }
      },
      child: const HomeStartView(),
    );
  }
}
