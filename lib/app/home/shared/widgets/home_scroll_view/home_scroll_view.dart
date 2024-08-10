import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart' as fc;
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view_loader_tile.dart';
import 'package:anikki/app/home/widgets/home_entry.dart';
import 'package:anikki/core/core.dart';

part 'home_scroll_view_loader.dart';

class HomeScrollView extends StatefulWidget {
  HomeScrollView({
    super.key,
    this.medias,
    this.loading = false,
    this.customTagsBuilder,
  }) {
    if (!loading) assert(medias != null);
  }

  final List<Media>? medias;
  final bool loading;
  final List<String> Function(Media media)? customTagsBuilder;

  static double getHeight(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return max(screenSize.height / 2.5, 400);
  }

  @override
  State<HomeScrollView> createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView> {
  final fc.CarouselController carouselController = fc.CarouselController();

  final scrollAnimationDuration = const Duration(milliseconds: 500);
  final scrollAnimationCurve = Curves.decelerate;
  final scrollAnimationOffset = 500;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HomeScrollView.getHeight(context),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: carouselController.previousPage,
              icon: const Icon(Ionicons.chevron_back),
            ),
          ),
          Expanded(
            child: widget.loading
                ? const HomeScrollViewLoader()
                : fc.FlutterCarousel.builder(
                    itemCount: widget.medias!.length,
                    options: fc.CarouselOptions(
                      controller: carouselController,
                      allowImplicitScrolling: true,
                      height: HomeScrollView.getHeight(context),
                      showIndicator: true,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      viewportFraction: 0.7,
                      slideIndicator: fc.CircularWaveSlideIndicator(),
                      floatingIndicator: false,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return HomeEntry(
                        media: widget.medias!.elementAt(index),
                        customTags: widget.customTagsBuilder != null
                            ? widget.customTagsBuilder!(
                                widget.medias!.elementAt(index))
                            : const [],
                        onExpanded: (key) {},
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: carouselController.nextPage,
              icon: const Icon(Ionicons.chevron_forward),
            ),
          ),
        ],
      ),
    );
  }
}
