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
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/core/core.dart';

class HomeContinueView extends StatefulWidget {
  const HomeContinueView({super.key});

  @override
  State<HomeContinueView> createState() => _HomeContinueViewState();
}

class _HomeContinueViewState extends State<HomeContinueView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, anilistAuthState) {
        return BlocBuilder<HomeContinueBloc, HomeContinueState>(
          builder: (context, state) {
            final initial = state is HomeContinueInitial;
            final loading = state is HomeContinueLoading;
            final errored = state is HomeContinueError;

            return HomeEntrySectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HomeEntrySectionTitle(
                    text: 'Continue watching',
                    actions: [
                      if (loading)
                        const HomeSectionTitleLoadingAction()
                      else
                        IconButton(
                          onPressed: () {
                            if (anilistAuthState is AnilistAuthSuccess) {
                              BlocProvider.of<HomeContinueBloc>(context).add(
                                HomeContinueRefresh(anilistAuthState.me.name),
                              );
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
                  HomeScrollView(
                    loading: state.entries.isEmpty &&
                        (loading || errored || initial),
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
              ),
            );
          },
        );
      },
    );
  }
}
