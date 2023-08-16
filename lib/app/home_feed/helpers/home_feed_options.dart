import 'package:anikki/app/home_feed/bloc/home_feed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:anikki/core/models/anikki_action.dart';
import 'package:ionicons/ionicons.dart';

List<AnikkiAction> homeFeedOptions(
  bool loaded,
  HomeFeedBloc bloc,
) {
  return [
    /// Show adult entries
    if (loaded)
      AnikkiAction(
        callback: (_) {
          bloc.add(
            HomeFeedOptionsChanged(
              options: bloc.state.options.copyWith(
                showAdult: !bloc.state.options.showAdult,
              ),
            ),
          );
        },
        icon: Ionicons.ban_outline,
        label: 'Adult entries',
        trailing: BlocBuilder<HomeFeedBloc, HomeFeedState>(
          builder: (context, state) {
            return Transform.scale(
              scale: 0.8,
              child: PlatformSwitch(
                value: state.options.showAdult,
                onChanged: (bool value) {
                  bloc.add(
                    HomeFeedOptionsChanged(
                      options: state.options.copyWith(
                        showAdult: value,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),

    /// Show japanese entries
    if (loaded)
      AnikkiAction(
        callback: (_) {
          bloc.add(
            HomeFeedOptionsChanged(
              options: bloc.state.options.copyWith(
                showOnlyJap: !bloc.state.options.showOnlyJap,
              ),
            ),
          );
        },
        icon: Ionicons.language_outline,
        label: 'Only Japanese entries',
        trailing: BlocBuilder<HomeFeedBloc, HomeFeedState>(
          builder: (context, state) {
            return Transform.scale(
              scale: 0.8,
              child: PlatformSwitch(
                value: state.options.showOnlyJap,
                onChanged: (bool value) {
                  bloc.add(
                    HomeFeedOptionsChanged(
                      options: state.options.copyWith(
                        showOnlyJap: value,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),

    /// Auto refresh
    AnikkiAction(
      callback: (_) {
        bloc.add(
          HomeFeedOptionsChanged(
            options: bloc.state.options.copyWith(
              autoRefresh: !bloc.state.options.autoRefresh,
            ),
          ),
        );
      },
      icon: Ionicons.sync_outline,
      label: 'Enable auto refresh',
      trailing: BlocBuilder<HomeFeedBloc, HomeFeedState>(
        builder: (context, state) {
          return Transform.scale(
            scale: 0.8,
            child: PlatformSwitch(
              value: state.options.autoRefresh,
              onChanged: (bool value) {
                bloc.add(
                  HomeFeedOptionsChanged(
                    options: state.options.copyWith(
                      autoRefresh: value,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ),
  ];
}
