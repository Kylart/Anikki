import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_carousel.dart/home_carousel.dart';
import 'package:anikki/app/home/widgets/background_image.dart';
import 'package:anikki/core/widgets/error_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          return Center(
            child: CustomErrorWidget(
              description: state.message,
            ),
          );
        }

        final media = state.currentMedia;

        final screenSize = MediaQuery.of(context).size;
        final carouselSize = Size(
          max(screenSize.width / 1.8, 500).toDouble(),
          max(screenSize.height / 2.5, 400).toDouble(),
        );

        return Stack(
          children: [
            if (media != null)
              Positioned.fill(
                child: HomeBackgroundImage(media: media),
              ),

            /// TODO: Implement actions and main title widget
            /// Watch
            /// Download
            /// Download episode
            /// Share
            if (state.entries.isNotEmpty)
              Positioned(
                right: 0,
                bottom: 0,
                width: carouselSize.width,
                height: carouselSize.height,
                child: HomeCarousel(
                  height: carouselSize.height,
                  width: carouselSize.width,
                  entries: state.entries,
                ),
              ),
          ],
        );
      },
    );
  }
}
