import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/random_play_button.dart';
import 'package:anikki/app/home/widgets/home_entry.dart';
import 'package:anikki/app/home_start/bloc/home_start_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/empty_widget.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/section/section_container.dart';
import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:anikki/core/widgets/section/section_title_loading_action.dart';
import 'package:anikki/core/widgets/section/section_title_warning.dart';

class HomeStartView extends StatelessWidget {
  const HomeStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, anilistAuthState) {
        return BlocBuilder<HomeStartBloc, HomeStartState>(
          builder: (context, state) {
            final watchListBloc =
                BlocProvider.of<WatchListBloc>(context, listen: true);

            final initial = state is HomeStartInitial;
            final empty = state is HomeStartEmpty;
            final loading = state is HomeStartLoading ||
                watchListBloc.state is WatchListLoading;
            final errored = state is HomeStartError;

            if (empty) return const SizedBox();

            return SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SectionTitle(
                    frosted: true,
                    text: 'Start watching',
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
                  else if (empty)
                    const EmptyWidget(
                      title: 'Nothing to start',
                      subtitle:
                          'It seems you watched everything there is to watch!',
                    )
                  else
                    HomeScrollView(
                      loading: state.entries.isEmpty && (loading || initial),
                      medias: state.entries
                          .map((e) => Media(anilistInfo: e.media))
                          .toList(),
                      builder: (media, expanded) => HomeEntry(
                        media: media,
                        expanded: expanded,
                        customTags: [
                          if (media.anilistInfo.streamingEpisodes?.isNotEmpty ==
                              true)
                            '${media.anilistInfo.streamingEpisodes?.length} episodes late'
                        ],
                      ),
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
