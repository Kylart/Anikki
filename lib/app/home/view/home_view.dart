import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/core/widgets/error_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final watchListBloc = BlocProvider.of<WatchListBloc>(
          context,
          listen: true,
        );

        final initial = state is HomeInitial;
        final errored = state is HomeError;
        final loading =
            state is HomeLoading || watchListBloc.state is WatchListLoading;

        if (initial) return const Text('Loading');
        if (loading && state.entries.isEmpty) return const Text('Loading');
        if (errored && state.entries.isEmpty) {
          return CustomErrorWidget(
            description: state.message,
          );
        }

        return Stack(
          children: [
            if (state.currentMedia != null)
              Positioned.fill(
                child: Text(state.currentMedia!.title ?? ''),
              ),
            if (state.entries.isNotEmpty)
              HomeScrollView(entries: state.entries),
          ],
        );
      },
    );
  }
}
