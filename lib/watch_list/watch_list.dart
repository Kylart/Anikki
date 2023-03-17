import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      length: AnilistMediaListStatus.values.length,
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
            return ListTile(
              tileColor: Theme.of(context).colorScheme.error,
              title: Text(error.cause),
              subtitle: Text(error.error ?? 'Something went wrong...'),
            );
          }
          return ListTile(
            tileColor: Theme.of(context).colorScheme.error,
            title: const Text('Error'),
            subtitle: const Text('Something went wrong...'),
          );
        }

        final watchList = context.watch<AnilistStore>().watchList;
        final tabs = AnilistMediaListStatus.values.map((status) {
          return Tab(
            text: status.label,
          );
        }).toList();

        return Column(
          children: [
            TabBar(
              isScrollable: MediaQuery.of(context).size.width < 600,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.black.withOpacity(0.04);
                  }
                  return null;
                },
              ),
              splashBorderRadius: const BorderRadius.all(Radius.circular(50)),
              tabs: tabs,
              controller: controller,
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: AnilistMediaListStatus.values.map((status) {
                  final entries = watchList[status] ?? [];

                  return WatchListLayout(entries: entries);
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
