import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
        FutureBuilder(
          future: store.getNews(dateRange),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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

            if (snapshot.hasError) {
              if (snapshot.error.runtimeType == AnilistGetScheduleException) {
                final error = snapshot.error as AnilistGetScheduleException;

                return ListTile(
                  tileColor: Theme.of(context).colorScheme.errorContainer,
                  title: Text(error.cause),
                  subtitle: Text(error.error ?? 'Something went wrong...'),
                );
              }

              return ListTile(
                tileColor: Theme.of(context).colorScheme.errorContainer,
                title: const Text('Error'),
                subtitle: const Text('Something went wrong...'),
              );
            }

            /// Fitlering over entries according to existing filters
            final anilistStore = context.watch<AnilistStore>();
            final data = snapshot.data!.where((entry) {
              bool included = true;

              if (anilistStore.isConnected && onlyFollowed) {
                included = isFollowed(store, entry);
              }

              if (anilistStore.isConnected &&
                  onlyUnseen &&
                  entry.episode != null) {
                included = isFollowed(store, entry) && !isSeen(store, entry);
              }

              return included;
            }).toList();

            if (data.isEmpty) {
              return const Expanded(
                child: ListTile(
                  title: Text('No result'),
                  subtitle: Text('Sadge'),
                ),
              );
            }

            return Expanded(
              child: NewsLayout(entries: data),
            );
          },
        ),
      ],
    );
  }
}
