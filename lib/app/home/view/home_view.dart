import 'package:flutter/material.dart';

import 'package:anikki/app/home/widgets/animated_media_banner.dart';
import 'package:anikki/app/home/widgets/custom_menu.dart';
import 'package:anikki/app/home/widgets/home_search_bar.dart';
import 'package:anikki/app/home_continue/home_continue.dart';
import 'package:anikki/app/home_feed/home_feed.dart';
import 'package:anikki/app/home_more/home_more.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedMediaBanner(),
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeSearchBar(),
                ],
              ),
              CustomMenu(),
              HomeContinuePage(),
              SizedBox(height: 24.0),
              HomeFeedPage(),
              SizedBox(height: 24.0),
              HomeMorePage(),
            ],
          ),
        ),
      ],
    );
  }
}
