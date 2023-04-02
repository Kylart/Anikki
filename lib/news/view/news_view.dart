import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/helpers/loader.dart';
import 'package:anikki/news/bloc/news_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/anilist_auth/mixins/anilist_auth_is_connected_mixin.dart';
import 'package:anikki/components/error_tile.dart';
import 'package:anikki/helpers/anilist/filters/filters.dart';
import 'package:anikki/news/widgets/news_app_bar.dart';
import 'package:anikki/news/view/news_layout.dart';

class NewsView extends StatefulWidget {
  const NewsView({
    Key? key,
    this.showOutline = true,
  }) : super(key: key);

  final bool showOutline;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> with AnilistAuthIsConnectedMixin {
  DateTimeRange dateRange = NewsBloc.initalDateRange;

  /// Filters
  bool onlyFollowed = false;
  bool onlyUnseen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsAppBar(
          showTitle: widget.showOutline,
          initialRange: dateRange,
          onDateChange: (DateTimeRange range) {
            setState(() {
              dateRange = range;
              BlocProvider.of<NewsBloc>(context)
                  .add(NewsRequested(range: range));
            });
          },
          onOnlyFollowedChanged: (value) => setState(() {
            onlyFollowed = value;
          }),
          onOnlySeenChanged: (value) => setState(() {
            onlyUnseen = value;
          }),
        ),
        BlocBuilder<NewsBloc, NewsState>(
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
                final entries = (state as NewsComplete)
                    .entries
                    .where((element) =>
                        (element.media?.isAdult != null &&
                            !element.media!.isAdult!) &&
                        element.media?.countryOfOrigin == 'JP')
                    .toList();

                /// Fitlering over entries according to existing filters
                final lists = BlocProvider.of<WatchListBloc>(context);
                final filteredEnries = entries.where((entry) {
                  bool included = true;

                  if (isConnected && lists.state is WatchListComplete) {
                    final state = lists.state as WatchListComplete;
                    if (onlyFollowed) {
                      included = isFollowed(state, entry);
                    }

                    if (onlyUnseen) {
                      included =
                          isFollowed(state, entry) && !isSeen(state, entry);
                    }
                  }

                  return included;
                }).toList();

                if (filteredEnries.isEmpty) {
                  return const Expanded(
                    child: ListTile(
                      title: Text('No result'),
                      subtitle: Text('Sadge'),
                    ),
                  );
                }

                return Expanded(child: NewsLayout(entries: filteredEnries));

              default:
                return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
