import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/anilist_auth/anilist_auth.dart';
import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/anilist_watch_list/view/watch_list_layout.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:anikki/core/widgets/section/section_title_loading_action.dart';
import 'package:anikki/core/widgets/user_list_layout_toggle.dart';
import 'package:anikki/data/data.dart';

part 'watch_list_complete_view.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    final connected = BlocProvider.of<AnilistAuthBloc>(context, listen: true)
        .state is AnilistAuthSuccess;

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final portrait = state is LayoutPortrait;

        return BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, state) {
            final initial = state is WatchListInitial;
            final errored = state is WatchListError;
            final loading = state is WatchListLoading;

            final actions = [
              const UserListLayoutToggle(),
              if (loading)
                const SectionTitleLoadingAction()
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    onPressed: () async {
                      final state =
                          BlocProvider.of<AnilistAuthBloc>(context).state;

                      if (state is AnilistAuthSuccess) {
                        BlocProvider.of<WatchListBloc>(context).add(
                          WatchListRequested(username: state.me.name),
                        );
                      }
                    },
                    icon: const AnikkiIcon(icon: Ionicons.refresh_outline),
                  ),
                ),
              if (connected)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Tooltip(
                    message: 'Logout of Anilist',
                    child: IconButton(
                      onPressed: () async {
                        BlocProvider.of<AnilistAuthBloc>(context).add(
                          AnilistAuthLogoutRequested(),
                        );
                      },
                      icon: const AnikkiIcon(icon: Ionicons.log_out_outline),
                    ),
                  ),
                ),
            ];

            return Column(
              children: [
                if (portrait)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions,
                  )
                else ...[
                  Row(
                    children: [
                      SectionTitle(
                        backgroundColor: Colors.transparent,
                        text: 'Watch Lists',
                        actions: actions,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                  ),
                ],
                if (initial)
                  const Center(
                    child: AnilistAuthView(),
                  ),
                if (!loading && errored && state.isEmpty)
                  CustomErrorWidget(
                    title: 'Could not load Watch list',
                    description: state.message,
                  ),
                if (!errored && loading && state.isEmpty) const Loader(),
                if (state.isNotEmpty)
                  Expanded(
                    child: _WatchListCompleteView(state),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
