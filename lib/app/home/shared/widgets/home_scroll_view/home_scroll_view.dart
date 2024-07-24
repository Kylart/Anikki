import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view_loader_tile.dart';
import 'package:anikki/core/core.dart';

part 'home_scroll_view_loader.dart';

class HomeScrollView extends StatefulWidget {
  HomeScrollView({
    super.key,
    required this.builder,
    this.medias,
    this.loading = false,
  }) {
    if (!loading) assert(medias != null);
  }

  final List<Media>? medias;
  final bool loading;
  final Widget Function(Media media, bool expanded) builder;

  static double getHeight(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return max(screenSize.height / 2.5, 400);
  }

  @override
  State<HomeScrollView> createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView> {
  int? currentlyHoveredId;

  late final ScrollController scrollController;

  final scrollAnimationDuration = const Duration(milliseconds: 500);
  final scrollAnimationCurve = Curves.decelerate;
  final scrollAnimationOffset = 500;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HomeScrollView.getHeight(context),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                scrollController.animateTo(
                  max(scrollController.offset - scrollAnimationOffset, 0),
                  duration: scrollAnimationDuration,
                  curve: scrollAnimationCurve,
                );
              },
              icon: const Icon(Ionicons.chevron_back),
            ),
          ),
          Expanded(
            child: widget.loading
                ? HomeScrollViewLoader(
                    scrollController: scrollController,
                  )
                : SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final (index, media) in widget.medias!.indexed)
                          Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 0 : 32.0,
                            ),
                            child: MouseRegion(
                              onEnter: (event) => setState(() {
                                currentlyHoveredId = media.anilistInfo.id;
                              }),
                              onExit: (event) => setState(() {
                                currentlyHoveredId = null;
                              }),
                              child: widget.builder(
                                media,
                                currentlyHoveredId == media.anilistInfo.id,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                scrollController.animateTo(
                  min(
                    scrollController.offset + scrollAnimationOffset,
                    scrollController.position.maxScrollExtent,
                  ),
                  duration: scrollAnimationDuration,
                  curve: scrollAnimationCurve,
                );
              },
              icon: const Icon(Ionicons.chevron_forward),
            ),
          ),
        ],
      ),
    );
  }
}
