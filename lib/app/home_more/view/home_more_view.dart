import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/home/shared/widgets/home_entry_section_title.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section_title_warning.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view_loader.dart';
import 'package:anikki/app/home/shared/widgets/home_section_title_loading_action.dart';
import 'package:anikki/app/home_more/bloc/home_more_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';

class HomeMoreView extends StatelessWidget {
  const HomeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMoreBloc, HomeMoreState>(
      builder: (context, state) {
        final loading = state is HomeMoreLoading;
        final errored = state is HomeMoreFailed;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeEntrySectionTitle(
              text: 'Discover',
              actions: [
                if (loading)
                  const HomeSectionTitleLoadingAction()
                else
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<HomeMoreBloc>(context)
                          .add(HomeMoreRefresh());
                    },
                    icon: const Icon(Ionicons.refresh_outline),
                  ),
                if (errored)
                  HomeEntrySectionTitleWarning(
                    message: state.message,
                  ),
              ],
            ),
            if (state.entries.isNotEmpty)
              HomeScrollView(
                children: [
                  for (final entry in state.entries)
                    HomeEntryCard(
                      media: entry,
                    ),
                ],
              ),
            if (loading && state.entries.isEmpty) const HomeScrollViewLoader(),
            if (errored && state.entries.isEmpty) const HomeScrollViewLoader(),
          ],
        );
      },
    );
  }
}
