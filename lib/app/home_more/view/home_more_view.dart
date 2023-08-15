import 'package:anikki/app/home/shared/widgets/home_entry_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home_more/bloc/home_more_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';

class HomeMoreView extends StatelessWidget {
  const HomeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMoreBloc, HomeMoreState>(
      builder: (context, state) {
        if (state is HomeMoreLoading && state.entries.isEmpty) {
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
              text: 'Discover',
            ),
            HomeScrollView(
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
