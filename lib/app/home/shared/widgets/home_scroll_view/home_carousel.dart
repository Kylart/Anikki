import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/core/core.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
    required this.medias,
  });

  final List<Media> medias;

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  Timer? timer;
  late final ScrollController scrollController;
  final listController = ListController();

  final toNextDuration = const Duration(seconds: 15);
  final itemAnimationDuration = const Duration(milliseconds: 300);

  int currentIndex = 0;
  int get currentMediaIndex => currentIndex % widget.medias.length;
  Media get currentMedia => widget.medias.elementAt(currentMediaIndex);

  @override
  void initState() {
    scrollController = ScrollController();
    setInitialIndex();
    updateCurrentMedia();

    timer = Timer.periodic(
      toNextDuration,
      (_) {
        setState(() {
          currentIndex++;

          goToItem(currentIndex);
          updateCurrentMedia();
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    timer?.cancel();
    super.dispose();
  }

  void setInitialIndex() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    currentIndex = max(
      widget.medias.indexWhere(
        (element) =>
            element.anilistInfo.id ==
            homeBloc.state.currentMedia?.anilistInfo.id,
      ),
      0,
    );
  }

  void updateCurrentMedia() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeCurrentMediaChanged(currentMedia),
    );
  }

  void goToItem(int index) {
    listController.animateToItem(
      curve: (estimatedDistance) => Curves.linear,
      duration: (estimatedDistance) => itemAnimationDuration,
      index: currentIndex,
      scrollController: scrollController,
      alignment: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = max(screenSize.height / 2.5, 300).toDouble();
    final width = max(screenSize.width / 1.8, 500).toDouble();

    return Positioned(
      right: 0,
      bottom: 0,
      width: width,
      height: height,
      child: SuperListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        listController: listController,
        controller: scrollController,
        itemCount: 10000000,
        itemBuilder: (context, index) {
          final i = index % widget.medias.length;
          final media = widget.medias.elementAt(i);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: itemAnimationDuration,
                constraints: BoxConstraints(
                  maxHeight: index == currentIndex ? height : height / 1.5,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      media.coverImage ?? '',
                    ),
                  ),
                ),
                child: const AspectRatio(
                  aspectRatio: 9 / 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
