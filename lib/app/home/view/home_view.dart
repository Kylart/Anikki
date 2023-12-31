import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/animated_media_banner.dart';
import 'package:anikki/app/home/widgets/home_search_bar.dart';
import 'package:anikki/app/home_continue/home_continue.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home_feed/home_feed.dart';
import 'package:anikki/app/home_feed/bloc/home_feed_bloc.dart';
import 'package:anikki/app/home_more/home_more.dart';
import 'package:anikki/app/home_start/home_start.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/home/shared/widgets/custom_menu.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Timer? interval;

  void updateBackgroundMedia() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final homeFeedBloc = BlocProvider.of<HomeFeedBloc>(context);
    final entries = <Media>[
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
    ]
        .where(
          (element) =>
              element.bannerImage != null &&
              (homeFeedBloc.state.options.showAdult
                  ? true
                  : element.anilistInfo.isAdult == false) &&
              (homeFeedBloc.state.options.showOnlyJap
                  ? element.anilistInfo.countryOfOrigin == 'JP'
                  : true),
        )
        .toSet()
        .toList();

    if (entries.isEmpty) return;

    homeBloc.add(
      HomeMediaChanged(
        entries.elementAt(
          Random().nextInt(entries.length),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS || Platform.isAndroid) {
      interval = Timer.periodic(
        const Duration(seconds: 10),
        (timer) => updateBackgroundMedia(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    interval?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        BlocProvider.of<AnilistAuthBloc>(context, listen: true).isConnected;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const AnimatedMediaBanner(),
        SingleChildScrollView(
          child: BlocBuilder<LayoutBloc, LayoutState>(
            builder: (context, state) {
              final landscape = state is LayoutLandscape;

              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (landscape) ...[
                    const SizedBox(
                      height: 250,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeSearchBar(),
                      ],
                    ),
                    const CustomMenu(),
                  ],
                  if (isAuthenticated) const HomeContinuePage(),
                  const HomeFeedPage(),
                  if (isAuthenticated) const HomeStartPage(),
                  const HomeMorePage(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
