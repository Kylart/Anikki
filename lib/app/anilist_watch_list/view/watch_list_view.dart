import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/user_list_layout_toggle.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/app/anilist_auth/anilist_auth.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/anilist_watch_list/view/watch_list_layout.dart';
import 'package:ionicons/ionicons.dart';

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
    final actions = [
      const UserListLayoutToggle(),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: IconButton(
          onPressed: () async {
            final state = BlocProvider.of<AnilistAuthBloc>(context).state;

            if (state is AnilistAuthSuccess) {
              BlocProvider.of<WatchListBloc>(context).add(
                WatchListRequested(username: state.me.name),
              );
            }
          },
          icon: const AnikkiIcon(icon: Ionicons.refresh_outline),
        ),
      ),
      BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
        builder: (context, state) {
          if (state is! AnilistAuthSuccess) return const SizedBox();

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Tooltip(
              message: 'Logout of Anilist',
              child: IconButton(
                onPressed: () async {
                  BlocProvider.of<AnilistAuthBloc>(context)
                      .add(AnilistAuthLogoutRequested());

                  if (BlocProvider.of<LayoutBloc>(context).state
                      is LayoutLandscape) {
                    Navigator.of(context).pop();
                  }
                },
                icon: const AnikkiIcon(icon: Ionicons.log_out_outline),
              ),
            ),
          );
        },
      ),
    ];

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final portrait = state is LayoutPortrait;

        return LayoutCard(
          transparent: portrait,
          child: Column(
            children: [
              if (portrait)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                )
              else
                AppBar(
                  title: const Text('Watch Lists'),
                  actions: actions,
                ),
              Expanded(
                child: BlocBuilder<WatchListBloc, WatchListState>(
                    builder: (context, state) {
                  switch (state.runtimeType) {
                    case const (WatchListInitial):
                      return const Center(child: AnilistAuthView());
                    case const (WatchListLoading):
                      return const Loader();
                    case const (WatchListComplete):
                      final entries = state.watchList;

                      return Column(
                        children: [
                          TabBar(
                            isScrollable:
                                MediaQuery.of(context).size.width < 600,
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 1.0,
                            splashBorderRadius:
                                const BorderRadius.all(Radius.circular(40)),
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
                                  .where(
                                      (element) => element.name != '\$unknown')
                                  .map(
                                (status) {
                                  late final List<AnilistWatchListEntry>
                                      statusEntries;

                                  switch (status) {
                                    case Enum$MediaListStatus.CURRENT:
                                      statusEntries = entries.current;
                                      break;
                                    case Enum$MediaListStatus.PLANNING:
                                      statusEntries = entries.planning;
                                      break;
                                    case Enum$MediaListStatus.COMPLETED:
                                      statusEntries = entries.completed;
                                      break;
                                    case Enum$MediaListStatus.DROPPED:
                                      statusEntries = entries.dropped;
                                      break;
                                    case Enum$MediaListStatus.PAUSED:
                                      statusEntries = entries.paused;
                                      break;
                                    case Enum$MediaListStatus.REPEATING:
                                      statusEntries = entries.repeating;
                                      break;
                                    default:
                                      statusEntries = const [];
                                      break;
                                  }

                                  return WatchListLayout(
                                    entries: statusEntries,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      );

                    case const (WatchListError):
                      final message = (state as WatchListError).message;
                      return ErrorTile(
                        title: 'Could not retrieve watch list.',
                        description: message,
                      );
                    default:
                      return const SizedBox();
                  }
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
