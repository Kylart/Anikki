import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/home/widgets/animated_media_banner.dart';
import 'package:anikki/app/home/widgets/custom_menu.dart';
import 'package:anikki/app/home/widgets/home_search_bar.dart';
import 'package:anikki/app/home_continue/home_continue.dart';
import 'package:anikki/app/home_feed/home_feed.dart';
import 'package:anikki/app/home_more/home_more.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        BlocProvider.of<AnilistAuthBloc>(context, listen: true).isConnected;

    const gap = SizedBox(height: 24.0);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const AnimatedMediaBanner(),
        SingleChildScrollView(
          child: BlocBuilder<LayoutBloc, LayoutState>(
            builder: (context, state) {
              final portrait = state is LayoutPortrait;

              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (!portrait)
                    const SizedBox(
                      height: 250,
                    ),
                  if (!portrait)
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeSearchBar(),
                      ],
                    ),
                  const CustomMenu(),
                  if (isAuthenticated) ...[
                    const HomeContinuePage(),
                    gap,
                  ],
                  const HomeFeedPage(),
                  gap,
                  const HomeMorePage(),
                  gap,
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
