import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/banner_image.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home_feed/bloc/home_feed_bloc.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/core.dart';

class AnimatedMediaBanner extends StatefulWidget {
  const AnimatedMediaBanner({super.key});

  @override
  State<AnimatedMediaBanner> createState() => _AnimatedMediaBannerState();
}

class _AnimatedMediaBannerState extends State<AnimatedMediaBanner> {
  Timer? interval;

  void updateBackgroundMedia() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final homeFeedBloc = BlocProvider.of<HomeFeedBloc>(context);
    final entries = <Media>{
      ...BlocProvider.of<HomeContinueBloc>(context)
          .state
          .entries
          .map((e) => Media(anilistInfo: e.media)),
      ...BlocProvider.of<HomeStartBloc>(context)
          .state
          .entries
          .map((e) => Media(anilistInfo: e.media)),
      ...homeFeedBloc.state.entries.map(
        (e) => Media(
          anilistInfo: e.media,
        ),
      ),
    }.where(
      (element) =>
          element.bannerImage != null &&
          (homeFeedBloc.state.options.showAdult
              ? true
              : element.anilistInfo.isAdult == false) &&
          (homeFeedBloc.state.options.showOnlyJap
              ? element.anilistInfo.countryOfOrigin == 'JP'
              : true),
    );

    if (entries.isEmpty) return;

    homeBloc.add(
      HomeBannerMediaChanged(
        entries.elementAt(
          Random().nextInt(entries.length),
        ),
      ),
    );
  }

  void initTimer() {
    if (isDesktop()) return;

    interval = Timer.periodic(
      const Duration(seconds: 10),
      (timer) => updateBackgroundMedia(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    interval?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LayoutBloc, LayoutState>(
      listener: (context, state) {
        initTimer();
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Row(
                    children: previousChildren
                        .map(
                          (e) => Expanded(child: e),
                        )
                        .toList(),
                  ),
                  if (currentChild != null)
                    Row(
                      children: [
                        Expanded(child: currentChild),
                      ],
                    ),
                ],
              );
            },
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: BannerImage(
              key: ValueKey(state.bannerMedia?.anilistInfo.id),
              url: context.portrait
                  ? state.bannerMedia?.coverImage
                  : state.bannerMedia?.bannerImage,
            ),
          );
        },
      ),
    );
  }
}
