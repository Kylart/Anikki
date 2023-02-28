import 'package:anikki/news/news_layout.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/components/box_skeleton.dart';
import 'package:anikki/news/news_app_bar.dart';
import 'package:anikki/news/news_list_view.dart';
import 'package:anikki/components/shared/custom_grid_view.dart';
import 'package:anikki/providers/anilist/anilist.dart';

class News extends StatefulWidget {
  const News({
    Key? key,
  }) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now().add(const Duration(days: 1)),
  );

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline.withOpacity(0.5);
    final store = context.read<AnilistStore>();

    return Flexible(
      flex: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: outlineColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            NewsAppBar(
              initialRange: dateRange,
              onDateChange: (DateTimeRange range) {
                setState(() {
                  dateRange = range;
                });
              },
            ),
            Divider(
              color: outlineColor,
              height: 1,
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
                  if (snapshot.error.runtimeType ==
                      AnilistGetScheduleException) {
                    final error = snapshot.error as AnilistGetScheduleException;

                    return Expanded(
                      child: ListTile(
                        tileColor: Theme.of(context).colorScheme.error,
                        title: Text(error.cause),
                        subtitle:
                            Text(error.error ?? 'Something went wrong...'),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListTile(
                      tileColor: Theme.of(context).colorScheme.error,
                      title: const Text('Error'),
                      subtitle: const Text('Something went wrong...'),
                    ),
                  );
                }

                if (snapshot.data!.isEmpty) {
                  return const Expanded(
                    child: ListTile(
                      title: Text('No result'),
                      subtitle: Text('Sadge'),
                    ),
                  );
                }

                return Expanded(
                  child: NewsLayout(entries: snapshot.data!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
