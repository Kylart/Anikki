import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_card/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section/home_entry_section_container.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section/home_entry_section_title.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section/home_entry_section_title_warning.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home/shared/widgets/home_section_title_loading_action.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';

class HomeStartView extends StatelessWidget {
  const HomeStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, anilistAuthState) {
        return BlocBuilder<HomeStartBloc, HomeStartState>(
          builder: (context, state) {
            final empty = state is HomeStartEmpty;
            final loading = state is HomeStartLoading;
            final errored = state is HomeStartError;

            if (empty) return const SizedBox();

            return HomeEntrySectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HomeEntrySectionTitle(
                    text: 'Start watching',
                    actions: [
                      if (loading)
                        const HomeSectionTitleLoadingAction()
                      else
                        IconButton(
                          onPressed: () {
                            if (anilistAuthState is AnilistAuthSuccess) {
                              BlocProvider.of<HomeStartBloc>(context).add(
                                  HomeStartRefresh(anilistAuthState.me.name));
                            }
                          },
                          icon: const Icon(Ionicons.refresh_outline),
                        ),
                      if (errored)
                        HomeEntrySectionTitleWarning(
                          message: state.message,
                        ),
                    ],
                  ),
                  BlocBuilder<LayoutBloc, LayoutState>(
                    builder: (context, layoutState) {
                      return HomeScrollView(
                        loading: state.entries.isEmpty && (loading || errored),
                        children: [
                          for (final entry in state.entries)
                            HomeEntryCard(
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
