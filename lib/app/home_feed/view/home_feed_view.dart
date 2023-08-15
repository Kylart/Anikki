import 'package:anikki/app/home/shared/widgets/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section_title.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home_feed/bloc/home_feed_bloc.dart';

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeedBloc, HomeFeedState>(
      builder: (context, state) {
        if (state is HomeFeedLoading && state.entries.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.entries.isEmpty) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const HomeEntrySectionTitle(
              text: 'Coming out soon',
            ),
            HomeScrollView(
              reverse: true,
              children: [
                for (final entry in state.entries)
                  HomeEntryCard(
                    media: entry,
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
