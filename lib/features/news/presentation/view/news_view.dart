import 'package:anikki/features/news/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';
import 'package:anikki/features/news/presentation/bloc/news_bloc.dart';
import 'package:anikki/features/news/presentation/widgets/news_app_bar.dart';
import 'package:anikki/features/news/presentation/widgets/news_layout.dart';
import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/core/widgets/loader.dart';

class NewsView extends StatelessWidget {
  const NewsView({
    Key? key,
    this.showOutline = true,
  }) : super(key: key);

  final bool showOutline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsAppBar(
          showTitle: showOutline,
        ),
        BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, watchListState) {
            bool isWatchListLoaded = watchListState is WatchListComplete;
            WatchListComplete? watchList =
                isWatchListLoaded ? watchListState : null;

            return BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case NewsLoading:
                    return const Expanded(child: Loader());

                  case NewsError:
                    final message = (state as NewsError).message;
                    return ErrorTile(
                      title: 'Could not retrieve the airing schedule.',
                      description: message,
                    );

                  case NewsComplete:
                    final currentState = (state as NewsComplete);
                    final entries = filterEntries(
                      currentState.entries,
                      currentState.options,
                      watchList,
                    );

                    if (entries.isEmpty) {
                      return const Expanded(
                        child: ListTile(
                          title: Text('No result'),
                          subtitle: Text('Sadge'),
                        ),
                      );
                    }

                    return Expanded(
                      child: NewsLayout(entries: entries),
                    );

                  default:
                    return const SizedBox();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
