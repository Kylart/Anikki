import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/random_play_button.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';
import 'package:anikki/core/widgets/section/section_container.dart';
import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:anikki/core/widgets/section/section_title_loading_action.dart';
import 'package:anikki/core/widgets/section/section_title_warning.dart';

class HomeStartView extends StatelessWidget {
  const HomeStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, anilistAuthState) {
        return BlocBuilder<HomeStartBloc, HomeStartState>(
          builder: (context, state) {
            final watchListBloc =
                BlocProvider.of<WatchListBloc>(context, listen: true);

            final initial = state is HomeStartInitial;
            final empty = state is HomeStartEmpty;
            final loading = state is HomeStartLoading ||
                watchListBloc.state is WatchListLoading;
            final errored = state is HomeStartError;

            if (empty) return const SizedBox();

            return SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SectionTitle(
                    frosted: true,
                    text: 'Start watching',
                    actions: [
                      if (loading || initial)
                        const SectionTitleLoadingAction()
                      else
                        IconButton(
                          onPressed: () {
                            if (anilistAuthState is AnilistAuthSuccess) {
                              watchListBloc.add(
                                WatchListRequested(
                                  username: anilistAuthState.me.name,
                                ),
                              );
                            }
                          },
                          icon: const Icon(Ionicons.refresh_outline),
                        ),
                      if (state.entries.isNotEmpty)
                        RandomPlayButton(
                          entries: state.entries,
                        ),
                      if (errored)
                        SectionTitleWarning(
                          message: state.message,
                        ),
                    ],
                  ),
                  BlocBuilder<LayoutBloc, LayoutState>(
                    builder: (context, layoutState) {
                      return HomeScrollView(
                        loading: state.entries.isEmpty &&
                            (loading || errored || initial),
                        children: [
                          for (final entry in state.entries)
                            EntryCard(
                              media: Media(anilistInfo: entry.media),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
