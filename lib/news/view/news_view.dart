import 'package:anikki/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/components/error_tile.dart';
import 'package:anikki/components/box_skeleton.dart';
import 'package:anikki/helpers/anilist/filters/filters.dart';
import 'package:anikki/news/widgets/news_app_bar.dart';
import 'package:anikki/news/view/news_layout.dart';
import 'package:anikki/providers/anilist/anilist.dart';

class NewsView extends StatefulWidget {
  const NewsView({
    Key? key,
    this.showOutline = true,
  }) : super(key: key);

  final bool showOutline;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  DateTimeRange dateRange = NewsBloc.initalDateRange;

  /// Filters
  bool onlyFollowed = false;
  bool onlyUnseen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsAppBar(
          showTitle: widget.showOutline,
          initialRange: dateRange,
          onDateChange: (DateTimeRange range) {
            setState(() {
              dateRange = range;
              context.read<NewsBloc>().add(NewsRequested(range: range));
            });
          },
          onOnlyFollowedChanged: (value) => setState(() {
            onlyFollowed = value;
          }),
          onOnlySeenChanged: (value) => setState(() {
            onlyUnseen = value;
          }),
        ),
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case NewsLoading:
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        int timer = 1000;

                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade500,
                          highlightColor: Colors.white38,
                          period: Duration(milliseconds: timer),
                          child: skeletonBox(),
                        );
                      },
                    ),
                  ),
                );

              case NewsError:
                final message = (state as NewsError).message;
                return ErrorTile(
                  title: 'Could not retrieve the airing schedule.',
                  description: message,
                );

              case NewsComplete:
                final entries = (state as NewsComplete)
                    .entries
                    .where((element) =>
                        (element.media?.isAdult != null &&
                            !element.media!.isAdult!) &&
                        element.media?.countryOfOrigin == 'JP')
                    .toList();

                /// Fitlering over entries according to existing filters
                final anilistStore = context.watch<AnilistStore>();
                final filteredEnries = entries.where((entry) {
                  bool included = true;

                  if (anilistStore.isConnected && onlyFollowed) {
                    included = isFollowed(anilistStore, entry);
                  }

                  if (anilistStore.isConnected && onlyUnseen) {
                    included = isFollowed(anilistStore, entry) &&
                        !isSeen(anilistStore, entry);
                  }

                  return included;
                }).toList();

                if (filteredEnries.isEmpty) {
                  return const Expanded(
                    child: ListTile(
                      title: Text('No result'),
                      subtitle: Text('Sadge'),
                    ),
                  );
                }

                return Expanded(child: NewsLayout(entries: filteredEnries));

              default:
                return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
