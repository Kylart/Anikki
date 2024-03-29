import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/animated_media_banner.dart';
import 'package:anikki/app/home/widgets/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return const Stack(
          alignment: Alignment.topCenter,
          children: [
            AnimatedMediaBanner(),
            HomeContent(),
          ],
        );
      },
    );
  }
}
