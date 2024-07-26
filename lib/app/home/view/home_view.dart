import 'package:anikki/app/home/features/home_timelines/home_timelines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/features/home_continue/view/home_continue_page.dart';
import 'package:anikki/app/home/features/home_start/home_start.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeContinuePage(),
                    HomeStartPage(),
                  ],
                ),
              ),
            ),
            VerticalDivider(
              width: 1,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: HomeTimelinesView(),
            ),
          ],
        );
      },
    );
  }
}
