import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/features/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/random_play_button.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/section/section_container.dart';
import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:anikki/core/widgets/section/section_title_loading_action.dart';
import 'package:anikki/core/widgets/section/section_title_warning.dart';

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
            final watchListBloc = BlocProvider.of<WatchListBloc>(
              context,
              listen: true,
            );

            final initial = state is HomeContinueInitial;
            final errored = state is HomeContinueError;
            final loading = state is HomeContinueLoading ||
                watchListBloc.state is WatchListLoading;

            return SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SectionTitle(
                    frosted: true,
                    text: 'Continue watching',
                    color:
                        context.colorScheme.primaryContainer.withOpacity(0.2),
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
                  if (errored)
                    Center(
                      child: CustomErrorWidget(
                        height: HomeScrollView.getHeight(context),
                        title: state.message,
                      ),
                    )
                  else
                    HomeScrollView(
                      loading: state.entries.isEmpty && (loading || initial),
                      medias: state.entries
                          .map((e) => Media(anilistInfo: e.media))
                          .toList(),
                      // customTagsBuilder: (media) => ,
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
