import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/helpers/capitalize.dart';
import 'package:anikki/components/error_tile.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/watch_list/watch_list_layout.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      vsync: this,
      length: Enum$MediaListStatus.values.length - 1,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AnilistStore>();

    if (!store.isConnected) {
      return ListTile(
        tileColor: Theme.of(context).colorScheme.error.withOpacity(0.3),
        title: const Text('Not logged into Anilist'),
        subtitle: const Text('Please login to Anilist to use this feature'),
      );
    }

    return FutureBuilder(
      future: store.getWatchLists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          if (snapshot.error.runtimeType == AnilistGetListException) {
            final error = snapshot.error as AnilistGetListException;

            return ErrorTile(
              title: error.cause,
              description: error.error,
            );
          }

          return const ErrorTile();
        }

        return Column(
          children: [
            TabBar(
              isScrollable: MediaQuery.of(context).size.width < 600,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              splashBorderRadius: const BorderRadius.all(Radius.circular(40)),
              tabs: Enum$MediaListStatus.values
                  .where((element) => element.name != '\$unknown')
                  .map(
                    (e) => Tab(
                      text: e.name.capitalize(),
                    ),
                  )
                  .toList(),
              controller: controller,
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: Enum$MediaListStatus.values
                    .where((element) => element.name != '\$unknown')
                    .map(
                      (status) => WatchListLayout(
                        entries:
                            context.watch<AnilistStore>().watchList[status] ??
                                [],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
