import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/landscape/background_image.dart';
import 'package:anikki/app/home/widgets/landscape/home_carousel.dart/home_carousel.dart';
import 'package:anikki/app/home/widgets/landscape/home_loader.dart';
import 'package:anikki/app/home/widgets/landscape/home_side_menu.dart';
import 'package:anikki/app/home/widgets/landscape/home_title/home_title.dart';
import 'package:anikki/core/widgets/error_widget.dart';

class HomeViewLandscape extends StatelessWidget {
  const HomeViewLandscape({
    super.key,
    required this.isWatchListLoading,
  });

  final bool isWatchListLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final initial = state is HomeInitial;
        final errored = state is HomeError;
        final loading = state is HomeLoading || isWatchListLoading;

        final screenSize = MediaQuery.of(context).size;
        final carouselSize = Size(
          max(screenSize.width / 1.8, 500).toDouble(),
          max(screenSize.height / 2.5, 200).toDouble(),
        );
        final maxTitleSize = Size(
          max(700, screenSize.width / 1.5),
          screenSize.height - carouselSize.height,
        );

        final loader = HomeLoader(
          carouselSize: carouselSize,
        );

        if (initial) return loader;
        if (loading && state.entries.isEmpty) {
          return loader;
        }
        if (errored && state.entries.isEmpty) {
          return Center(
            child: CustomErrorWidget(
              description: state.message,
            ),
          );
        }

        return Stack(
          children: [
            if (state.currentEntry != null) ...[
              Positioned.fill(
                child: HomeBackgroundImage(media: state.currentMedia!),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: HomeTitle(
                  entry: state.currentEntry!,
                  maxSize: maxTitleSize,
                ),
              )
                  .animate()
                  .fadeIn(
                    duration: 500.ms,
                  )
                  .slideX(
                    duration: 500.ms,
                    end: 0,
                    begin: -0.5,
                  ),
            ],
            Positioned(
              right: 0.0,
              bottom: carouselSize.height + 24.0,
              child: HomeSideMenu(
                loading: loading,
              ),
            ),
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
              )
                  .animate()
                  .fadeIn(
                    duration: 500.ms,
                  )
                  .slideX(
                    duration: 500.ms,
                    end: 0,
                    begin: 0.5,
                  ),
          ],
        );
      },
    );
  }
}
