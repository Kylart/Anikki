import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/home/shared/helpers/should_be_marquee.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home_more/bloc/home_more_bloc.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';
import 'package:anikki/core/widgets/section/section_container.dart';
import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:anikki/core/widgets/section/section_title_loading_action.dart';
import 'package:anikki/core/widgets/section/section_title_warning.dart';

class HomeMoreView extends StatelessWidget {
  const HomeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMoreBloc, HomeMoreState>(
      builder: (context, state) {
        final initial = state is HomeMoreInitial;
        final loading = state is HomeMoreLoading;
        final errored = state is HomeMoreFailed;

        return SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SectionTitle(
                text: 'Discover',
                actions: [
                  if (loading)
                    const SectionTitleLoadingAction()
                  else
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeMoreBloc>(context)
                            .add(HomeMoreRefresh());
                      },
                      icon: const Icon(Ionicons.refresh_outline),
                    ),
                  if (errored)
                    SectionTitleWarning(
                      message: state.message,
                    ),
                ],
              ),
              BlocBuilder<LayoutBloc, LayoutState>(
                builder: (context, layoutState) {
                  return BlocBuilder<HomeStartBloc, HomeStartState>(
                    builder: (context, homeStartState) {
                      return HomeScrollView(
                        loading: state.entries.isEmpty &&
                            (loading || errored || initial),
                        reverse: homeStartState is HomeStartEmpty ||
                                homeStartState is HomeStartInitial
                            ? false
                            : shouldBeMarquee(
                                layoutState,
                                homeStartState.entries.length,
                              ),
                        children: [
                          for (final entry in state.entries)
                            EntryCard(
                              media: entry,
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
