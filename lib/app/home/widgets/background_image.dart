import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/core/core.dart';

class HomeBackgroundImage extends StatelessWidget {
  const HomeBackgroundImage({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.topCenter,
              children: <Widget>[
                Column(
                  children: [
                    ...previousChildren.map(
                      (e) => Expanded(child: e),
                    )
                  ],
                ),
                if (currentChild != null)
                  Column(
                    children: [
                      Expanded(child: currentChild),
                    ],
                  ),
              ],
            );
          },
          child: state.currentBackgroundUrl != null
              ? Image.network(
                  key: ValueKey(state.currentBackgroundUrl),
                  state.currentBackgroundUrl!,
                  fit: BoxFit.cover,
                )
              : const SizedBox(),
        );
      },
    );
  }
}
