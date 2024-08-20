import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/core/core.dart';

part 'home_carousel_actions.dart';
part 'home_carousel_container.dart';
part 'home_carousel_image.dart';
part 'home_carousel_navigation.dart';
part 'home_carousel_title.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
    required this.entries,
    required this.height,
    required this.width,
  });

  final List<MediaListEntry> entries;
  final double width;
  final double height;

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final itemAspectRatio = 9 / 14;

  Timer? timer;
  late final ScrollController scrollController;
  late final ListController listController;

  final toNextDuration = const Duration(seconds: 15);
  final itemAnimationDuration = const Duration(milliseconds: 300);

  int currentIndex = 0;
  int get currentMediaIndex => currentIndex % widget.entries.length;
  MediaListEntry get currentEntry =>
      widget.entries.elementAt(currentMediaIndex);

  @override
  void initState() {
    scrollController = ScrollController();
    listController = ListController();
    setInitialIndex();
    updateCurrentMedia();
    setTimer();

    if (currentIndex != 0) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => goToItem(currentIndex),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    listController.dispose();
    timer?.cancel();
    super.dispose();
  }

  void setTimer() {
    timer = Timer.periodic(
      toNextDuration,
      (_) {
        goToItem(currentIndex + 1);
        updateCurrentMedia();
      },
    );
  }

  void setInitialIndex() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    currentIndex = max(
      widget.entries.indexWhere(
        (element) =>
            element.media.anilistInfo.id ==
            homeBloc.state.currentMedia?.anilistInfo.id,
      ),
      0,
    );
  }

  void updateCurrentMedia() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeCurrentMediaChanged(currentEntry),
    );
  }

  void goToItem(int index, {bool resetTimer = false}) {
    if (!mounted) return;

    if (resetTimer) {
      timer?.cancel();
      setTimer();
    }

    setState(() {
      currentIndex = max(index, 0);
      updateCurrentMedia();
    });

    if (!listController.isAttached) return;

    listController.animateToItem(
      curve: (estimatedDistance) => Curves.linear,
      duration: (estimatedDistance) => itemAnimationDuration,
      index: currentIndex,
      scrollController: scrollController,
      alignment: 0.0,
    );
  }

  Size get cardSize => Size(widget.width, widget.height);
  double get reducedHeight => cardSize.height / 1.3;

  @override
  Widget build(BuildContext context) {
    return _HomeCarouselContainer(
      child: Stack(
        children: [
          Positioned.fill(
            child: SuperListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              listController: listController,
              controller: scrollController,
              itemCount: 10000000,
              itemBuilder: (context, index) {
                final i = index % widget.entries.length;
                final entry = widget.entries.elementAt(i);

                return _HomeCarouselImage(
                  goToItem: goToItem,
                  realIndex: index,
                  currentIndex: currentIndex,
                  itemAnimationDuration: itemAnimationDuration,
                  cardSize: cardSize,
                  reducedHeight: reducedHeight,
                  itemAspectRatio: itemAspectRatio,
                  entry: entry,
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: cardSize.height * itemAspectRatio + 12,
            width: cardSize.width - (cardSize.height * itemAspectRatio + 12),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: cardSize.height - reducedHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 12.0,
                  left: 12.0,
                  top: 4.0,
                  bottom: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: _HomeCarouselTitle(
                            currentMedia: currentEntry.media,
                          ),
                        ),
                        _HomeCarouselNavigation(
                          text:
                              '${currentMediaIndex + 1} / ${widget.entries.length}',
                          onNext: () => goToItem(
                            currentIndex + 1,
                            resetTimer: true,
                          ),
                          onPrevious: () => goToItem(
                            currentIndex - 1,
                            resetTimer: true,
                          ),
                        ),
                      ],
                    ),
                    _HomeCarouselActions(
                      media: currentEntry.media,
                      numberOfItems: widget.entries.length,
                      goToItem: goToItem,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
