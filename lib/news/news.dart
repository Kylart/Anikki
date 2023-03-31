import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/components/error_tile.dart';
import 'package:anikki/components/box_skeleton.dart';
import 'package:anikki/helpers/anilist/filters/filters.dart';
import 'package:anikki/news/news_app_bar.dart';
import 'package:anikki/news/news_layout.dart';
import 'package:anikki/providers/anilist/anilist.dart';

class News extends StatefulWidget {
  const News({
    Key? key,
    this.showOutline = true,
  }) : super(key: key);

  final bool showOutline;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now().add(const Duration(days: 1)),
  );

  /// Filters
  bool onlyFollowed = false;
  bool onlyUnseen = false;

  int page = 1;

  Variables$Query$AiringSchedule get variables =>
      Variables$Query$AiringSchedule(
        start: (dateRange.start.millisecondsSinceEpoch / 1000).round(),
        end: (dateRange.end.millisecondsSinceEpoch / 1000).round(),
        page: page,
      );

  @override
  Widget build(BuildContext context) {
    final store = context.read<AnilistStore>();

    return Column(
      children: [
        NewsAppBar(
          showTitle: widget.showOutline,
          initialRange: dateRange,
          onDateChange: (DateTimeRange range) {
            setState(() {
              dateRange = range;
            });
          },
          onOnlyFollowedChanged: (value) => setState(() {
            onlyFollowed = value;
          }),
          onOnlySeenChanged: (value) => setState(() {
            onlyUnseen = value;
          }),
        ),
        Query$AiringSchedule$Widget(
          options: Options$Query$AiringSchedule(
            variables: variables,
          ),
          builder: (result, {fetchMore, refetch}) {
            final hasMore =
                result.parsedData?.Page?.pageInfo?.hasNextPage ?? false;

            if (!hasMore) {
              page = 1;
            }

            if (hasMore && fetchMore != null) {
              page++;
              fetchMore(
                FetchMoreOptions(
                  variables: variables.toJson(),
                  updateQuery: (previousResultData, fetchMoreResultData) {
                    fetchMoreResultData?['Page']['airingSchedules'] = [
                      ...previousResultData?['Page']['airingSchedules']
                          as List<dynamic>,
                      ...fetchMoreResultData['Page']['airingSchedules']
                          as List<dynamic>,
                    ];

                    return fetchMoreResultData;
                  },
                ),
              );
            }

            if (result.hasException) {
              if (result.exception.runtimeType == AnilistGetScheduleException) {
                final error = result.exception as AnilistGetScheduleException;

                return ErrorTile(
                  title: error.cause,
                  description: error.error,
                );
              }

              return const ErrorTile();
            }

            final entries = result.parsedData?.Page?.airingSchedules
                    ?.whereType<Query$AiringSchedule$Page$airingSchedules>()
                    .where((element) =>
                        (element.media?.isAdult != null &&
                            !element.media!.isAdult!) &&
                        element.media?.countryOfOrigin == 'JP')
                    .toList() ??
                [];

            if (result.isLoading && entries.isEmpty) {
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
            }

            /// Fitlering over entries according to existing filters
            final anilistStore = context.watch<AnilistStore>();
            final filteredEnries = entries.where((entry) {
              bool included = true;

              if (anilistStore.isConnected && onlyFollowed) {
                included = isFollowed(store, entry);
              }

              if (anilistStore.isConnected && onlyUnseen) {
                included = isFollowed(store, entry) && !isSeen(store, entry);
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

            return Expanded(
              child: NewsLayout(entries: filteredEnries),
            );
          },
        ),
      ],
    );
  }
}
