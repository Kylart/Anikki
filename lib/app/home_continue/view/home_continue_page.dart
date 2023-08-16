import 'package:flutter/material.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home_continue/view/home_continue_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContinuePage extends StatelessWidget {
  const HomeContinuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchListBloc, WatchListState>(
      listener: (context, state) {
        if (state is WatchListComplete && state.username != null) {
          BlocProvider.of<HomeContinueBloc>(context)
              .add(HomeContinueRefresh(state.username!));
        }
      },
      child: const HomeContinueView(),
    );
  }
}
