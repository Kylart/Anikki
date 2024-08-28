import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/background_image.dart';
import 'package:anikki/app/home/widgets/home_carousel.dart/home_carousel.dart';
import 'package:anikki/app/home/widgets/home_title/home_title.dart';
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
        final initial = state is HomeInitial;
        final errored = state is HomeError;
        final loading = state is HomeLoading;

        if (initial) return const Text('Loading');
        if (loading && state.entries.isEmpty) return const Text('Loading');
        if (errored && state.entries.isEmpty) {
          return Center(
            child: CustomErrorWidget(
              description: state.message,
            ),
          );
        }

        final screenSize = MediaQuery.of(context).size;
        final carouselSize = Size(
          max(screenSize.width / 1.8, 700).toDouble(),
          max(screenSize.height / 2.5, 400).toDouble(),
        );
        final maxTitleSize = Size(
          max(700, screenSize.width / 1.5),
          screenSize.height - carouselSize.height,
        );

        return Stack(
          children: [
            if (state.currentMedia != null) ...[
              Positioned.fill(
                child: HomeBackgroundImage(media: state.currentMedia!),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: HomeTitle(
                  media: state.currentMedia!,
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
