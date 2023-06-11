import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:anikki/features/news/bloc/news_bloc.dart';
import 'package:anikki/models/anikki_action.dart';

List<AnikkiAction> newsOptionsActions(
  bool isConnected,
  bool isLoaded,
  NewsBloc bloc,
) {
  return [
    /// Show bookmarked entries
    if (isConnected && isLoaded)
      AnikkiAction(
        callback: (_) {
          bloc.add(
            NewsOptionsChanged(
              options: bloc.state.options.copyWith(
                showOnlyBookmarked: !bloc.state.options.showOnlyBookmarked,
              ),
            ),
          );
        },
        icon: Icons.bookmark_add_outlined,
        label: 'Only followed entries',
        trailing: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return PlatformSwitch(
              value: state.options.showOnlyBookmarked,
              onChanged: (bool value) {
                bloc.add(
                  NewsOptionsChanged(
                    options: state.options.copyWith(
                      showOnlyBookmarked: value,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

    /// Show only not seen entries
    if (isConnected && isLoaded)
      AnikkiAction(
        callback: (_) {
          bloc.add(
            NewsOptionsChanged(
              options: bloc.state.options.copyWith(
                showOnlyUnseen: !bloc.state.options.showOnlyUnseen,
              ),
            ),
          );
        },
        icon: Icons.bookmark_added_outlined,
        label: 'Only unseen entries',
        trailing: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return PlatformSwitch(
              value: state.options.showOnlyUnseen,
              onChanged: (bool value) {
                bloc.add(
                  NewsOptionsChanged(
                    options: state.options.copyWith(
                      showOnlyUnseen: value,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

    /// Show adult entries
    if (isLoaded)
      AnikkiAction(
        callback: (_) {
          bloc.add(
            NewsOptionsChanged(
              options: bloc.state.options.copyWith(
                showAdult: !bloc.state.options.showAdult,
              ),
            ),
          );
        },
        icon: Icons.no_adult_content,
        label: 'Adult entries',
        trailing: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return PlatformSwitch(
              value: state.options.showAdult,
              onChanged: (bool value) {
                bloc.add(
                  NewsOptionsChanged(
                    options: state.options.copyWith(
                      showAdult: value,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

    /// Show japanese entries
    if (isLoaded)
      AnikkiAction(
        callback: (_) {
          bloc.add(
            NewsOptionsChanged(
              options: bloc.state.options.copyWith(
                showOnlyJap: !bloc.state.options.showOnlyUnseen,
              ),
            ),
          );
        },
        icon: Icons.travel_explore,
        label: 'Only Japanese entries',
        trailing: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return PlatformSwitch(
              value: state.options.showOnlyJap,
              onChanged: (bool value) {
                bloc.add(
                  NewsOptionsChanged(
                    options: state.options.copyWith(
                      showOnlyJap: value,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

    /// Auto refresh
    AnikkiAction(
      callback: (_) {
        bloc.add(
          NewsOptionsChanged(
            options: bloc.state.options.copyWith(
              autoRefresh: !bloc.state.options.autoRefresh,
            ),
          ),
        );
      },
      icon: Icons.refresh_rounded,
      label: 'Enable auto refresh',
      trailing: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return PlatformSwitch(
            value: state.options.autoRefresh,
            onChanged: (bool value) {
              bloc.add(
                NewsOptionsChanged(
                  options: state.options.copyWith(
                    autoRefresh: value,
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  ];
}
