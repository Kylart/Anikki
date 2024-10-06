import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class HomeViewPortrait extends StatefulWidget {
  const HomeViewPortrait({
    super.key,
    required this.isWatchListLoading,
  });

  final bool isWatchListLoading;

  @override
  State<HomeViewPortrait> createState() => _HomeViewPortraitState();
}

class _HomeViewPortraitState extends State<HomeViewPortrait>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: HomeMediaType.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const HomeAppBarContent(),
          ),
          body: HomeContent(),
        );
      },
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final ExpandableCarouselController _controller =
      ExpandableCarouselController();
  late final ScrollController scrollController;
  late final ListController listController;

  @override
  void initState() {
    scrollController = ScrollController();
    listController = ListController();

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final initial = state is HomeInitial;
        final loading = state is HomeLoading;
        final errored = state is HomeError;

        if (initial || loading) {
          return Center(
            child: LoadingWidget(),
          );
        }

        if (errored && state.entries.isEmpty) {
          return Center(
            child: CustomErrorWidget(
              description: state.message,
            ),
          );
        }

        final screenSize = MediaQuery.of(context).size;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpandableCarousel.builder(
              options: ExpandableCarouselOptions(
                aspectRatio: 9 / 16,
                autoPlayInterval: const Duration(seconds: 15),
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: true,
                controller: _controller,
                showIndicator: false,
                floatingIndicator: false,
                restorationId: 'expandable_carousel',
                onPageChanged: (index, reason) {
                  final entry =
                      state.entries.elementAt(index % state.entries.length);

                  BlocProvider.of<HomeBloc>(context).add(
                    HomeCurrentMediaChanged(entry),
                  );
                },
              ),
              itemCount: state.entries.length,
              itemBuilder: (context, index, realIdx) {
                final entry = state.entries.elementAt(index);

                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: SizedBox(
                    height: screenSize.height / 1.8,
                    child: entry.media.posterImage != null
                        ? CachedNetworkImage(
                            imageUrl: entry.media.posterImage!,
                            fit: BoxFit.fill,
                          )
                        : const SizedBox(),
                  ),
                );
              },
            ),
            Text(state.currentEntry?.media.title ?? 'N/A'),
          ],
        );
      },
    );
  }
}

class HomeAppBarContent extends StatelessWidget {
  const HomeAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SegmentedButton(
          multiSelectionEnabled: false,
          emptySelectionAllowed: false,
          selectedIcon: const SizedBox(),
          segments: [
            for (final type in HomeMediaType.values)
              ButtonSegment(
                value: type,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    switch (type) {
                      HomeMediaType.following =>
                        HugeIcons.strokeRoundedAllBookmark,
                      HomeMediaType.toStart =>
                        HugeIcons.strokeRoundedBookmarkAdd02,
                      HomeMediaType.trending => HugeIcons.strokeRoundedFire,
                      HomeMediaType.recommendations =>
                        HugeIcons.strokeRoundedThumbsUp,
                    },
                  ),
                ),
                tooltip: switch (type) {
                  HomeMediaType.following => 'Following',
                  HomeMediaType.toStart => 'To start',
                  HomeMediaType.trending => 'Trending',
                  HomeMediaType.recommendations => 'Recommended',
                },
              ),
          ],
          selected: {state.type},
          onSelectionChanged: (selection) {
            final requestedType = selection.first;
            final watchListBloc = BlocProvider.of<WatchListBloc>(context);

            BlocProvider.of<HomeBloc>(context).add(
              HomeRefreshed(
                requestedType: requestedType,
                connected: watchListBloc.state.connected,
                watchList: watchListBloc.state.watchList,
              ),
            );
          },
        );
      },
    );
  }
}
