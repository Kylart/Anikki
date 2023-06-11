import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/anilist_auth/anilist_auth.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/core/helpers/capitalize.dart';
import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/features/watch_list/view/watch_list_layout.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView>
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
    final state = BlocProvider.of<WatchListBloc>(context, listen: true).state;

    switch (state.runtimeType) {
      case WatchListInitial:
        return const Center(child: AnilistAuthView());
      case WatchListLoading:
        return const Loader();
      case WatchListComplete:
        final entries = (state as WatchListComplete).watchList;

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
                        entries: entries[status] ?? [],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );

      case WatchListError:
        final message = (state as WatchListError).message;
        return ErrorTile(
          title: 'Could not retrieve watch list.',
          description: message,
        );
      default:
        return const SizedBox();
    }
  }
}
