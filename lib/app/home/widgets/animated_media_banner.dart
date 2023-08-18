import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/banner_image.dart';

class AnimatedMediaBanner extends StatelessWidget {
  const AnimatedMediaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.topCenter,
              children: <Widget>[
                Row(
                  children: previousChildren
                      .map((e) => Expanded(
                            child: e,
                          ))
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
            key: ValueKey(state.media?.anilistInfo.id),
            url: state.media?.bannerImage,
          ),
        );
      },
    );
  }
}
