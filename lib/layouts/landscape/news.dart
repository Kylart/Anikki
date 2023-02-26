import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/components/box_skeleton.dart';
import 'package:anikki/components/news/news_app_bar.dart';
import 'package:anikki/components/news/news_list_view.dart';
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
  String layout = 'grid';

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline.withOpacity(0.5);
    final store = context.watch<AnilistStore>();

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
              onLayoutChange: (String l) {
                setState(() {
                  layout = l;
                });
              },
            ),
            Divider(
              color: outlineColor,
              height: 1,
            ),
            if (store.newsError != null) Text('Error ${store.newsError}'),
            if (store.isLoading)
              Expanded(
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
              ),
            if (store.currentNews.isNotEmpty && layout == 'list')
              Expanded(
                child: NewsListView(
                  entries: store.currentNews,
                ),
              ),
            if (store.currentNews.isNotEmpty && layout == 'grid')
              Expanded(
                child: CustomGridView<ScheduleEntry>(
                  entries: store.currentNews,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
