import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section_title.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';
import 'package:anikki/core/core.dart';

class HomeContinueView extends StatelessWidget {
  const HomeContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnilistAuthBloc, AnilistAuthState>(
      listener: (context, state) {
        if (state is AnilistAuthSuccess) {
          BlocProvider.of<HomeContinueBloc>(context).add(
            HomeContinueRefresh(state.me.name),
          );
        }
      },
      child: BlocBuilder<HomeContinueBloc, HomeContinueState>(
        builder: (context, state) {
          if (state is HomeContinueLoading && state.entries.isEmpty) {
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
                text: 'Continue watching',
              ),
              HomeScrollView(
                children: [
                  for (final entry in state.entries)
                    HomeEntryCard(
                      media: Media(anilistInfo: entry.media),
                      text: entry.progress != null
                          ? (entry.progress! + 1).toString()
                          : null,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
