import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

part 'home_title_carousel_container.dart';
part 'home_title_carousel_image.dart';

class HomeTitleCarousel extends StatefulWidget {
  const HomeTitleCarousel({
    super.key,
    required this.media,
    required this.minWidth,
  });

  final Media media;
  final double minWidth;

  @override
  State<HomeTitleCarousel> createState() => _HomeTitleCarouselState();
}

class _HomeTitleCarouselState extends State<HomeTitleCarousel> {
  late final ScrollController scrollController;
  late final ListController listController;

  int currentIndex = 0;

  List<String?> get imageUrls =>
      widget.media.images!.backdrops
          ?.where((backdrop) => backdrop.filePath != null)
          .map((backdrop) => getTmdbImageUrl(backdrop.filePath!))
          .toList() ??
      [];

  @override
  void initState() {
    scrollController = ScrollController();
    listController = ListController();
    setInitialIndex();

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
    super.dispose();
  }

  void setInitialIndex() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    currentIndex = max(
      imageUrls.indexWhere(
        (imageUrl) => imageUrl == homeBloc.state.currentBackgroundUrl,
      ),
      0,
    );
  }

  void goToItem(int index) {
    if (!mounted) return;
    if (index < 0) return;
    if (index == imageUrls.length - 1) return;

    setState(() {
      currentIndex = max(index, 0);
    });

    if (!listController.isAttached) return;

    listController.animateToItem(
      curve: (estimatedDistance) => Curves.decelerate,
      duration: (estimatedDistance) => const Duration(milliseconds: 300),
      index: currentIndex,
      scrollController: scrollController,
      alignment: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeTitleCarouselContainer(
      minWidth: widget.minWidth,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          goToItem(
            imageUrls.indexOf(state.currentBackgroundUrl),
          );
        },
        builder: (context, state) {
          return Row(
            children: [
              IconButton(
                iconSize: 32,
                onPressed: () {
                  goToItem(currentIndex - 1);
                },
                icon: const Icon(HugeIcons.strokeRoundedArrowLeft01),
              ),
              Expanded(
                child: SuperListView.builder(
                  itemCount: imageUrls.length,
                  scrollDirection: Axis.horizontal,
                  listController: listController,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    final imageUrl = imageUrls.elementAt(index);
                    final isLast = index == imageUrls.length - 1;

                    return Padding(
                      padding: EdgeInsets.only(right: isLast ? 0.0 : 8.0),
                      child: _HomeTitleCarouselImage(
                        selected: imageUrl != null
                            ? state.currentBackgroundUrl == imageUrl
                            : false,
                        url: imageUrl!,
                      ),
                    );
                  },
                ),
              ),
              IconButton(
                iconSize: 32,
                onPressed: () {
                  goToItem(currentIndex + 1);
                },
                icon: const Icon(HugeIcons.strokeRoundedArrowRight01),
              ),
            ],
          );
        },
      ),
    );
  }
}
