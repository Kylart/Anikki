import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/home_feed/bloc/home_feed_bloc.dart';
import 'package:anikki/app/home_feed/helpers/home_feed_options.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section_title.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view_loader.dart';
import 'package:anikki/app/home/shared/widgets/home_section_title_loading_action.dart';
import 'package:anikki/core/widgets/anikki_action_button.dart';

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeedBloc, HomeFeedState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<HomeFeedBloc>(context);
        final loading = state is HomeFeedLoading;
        final loaded = state is HomeFeedLoaded;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeEntrySectionTitle(
              text: 'Coming out soon',
              actions: [
                if (loading)
                  const HomeSectionTitleLoadingAction()
                else
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<HomeFeedBloc>(context)
                          .add(HomeFeedRefresh());
                    },
                    icon: const Icon(Ionicons.refresh_outline),
                  ),
                if (loaded)
                  AnikkiActionButton(
                    actions: homeFeedOptions(loaded, bloc),
                  )
              ],
            ),
            if (state.entries.isNotEmpty)
              HomeScrollView(
                reverse: true,
                children: [
                  for (final entry in bloc.repository.filterEntries(
                    state.entries,
                    state.options,
                  ))
                    HomeEntryCard(
                      media: entry,
                    ),
                ],
              ),
            if (loading && state.entries.isEmpty) const HomeScrollViewLoader(),
          ],
        );
      },
    );
  }
}
