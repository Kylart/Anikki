import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/view/home_view_landscape.dart';
import 'package:anikki/app/home/view/home_view_portrait.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

part 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        return _HomeView(
          isWatchListLoading: state is WatchListLoading,
        );
      },
    );
  }
}
