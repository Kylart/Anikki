import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view_loader.dart';
import 'package:anikki/app/home/shared/widgets/home_section_title_loading_action.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_card.dart';
import 'package:anikki/app/home/shared/widgets/home_entry_section_title.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';
import 'package:anikki/core/core.dart';

class HomeContinueView extends StatefulWidget {
  const HomeContinueView({super.key});

  @override
  State<HomeContinueView> createState() => _HomeContinueViewState();
}

class _HomeContinueViewState extends State<HomeContinueView> {
  String? username;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnilistAuthBloc, AnilistAuthState>(
      listener: (context, state) {
        if (state is AnilistAuthSuccess) {
          setState(() {
            username = state.me.name;
            BlocProvider.of<HomeContinueBloc>(context).add(
              HomeContinueRefresh(username!),
            );
          });
        }
      },
      child: BlocBuilder<HomeContinueBloc, HomeContinueState>(
        builder: (context, state) {
          final loading = state is HomeContinueLoading;

          return Column(
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
                        BlocProvider.of<HomeContinueBloc>(context)
                            .add(HomeContinueRefresh(username!));
                      },
                      icon: const Icon(Ionicons.refresh_outline),
                    ),
                ],
              ),
              if (state.entries.isNotEmpty)
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
              if (loading && state.entries.isEmpty)
                const HomeScrollViewLoader(),
            ],
          );
        },
      ),
    );
  }
}
