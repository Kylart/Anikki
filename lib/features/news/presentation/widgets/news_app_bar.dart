import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/news/presentation/helpers/news_options_actions.dart';
import 'package:anikki/features/news/presentation/bloc/news_bloc.dart';
import 'package:anikki/core/helpers/connectivity_bloc/connectivity_bloc.dart';
import 'package:anikki/features/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/features/news/presentation/widgets/news_layout_toggle.dart';
import 'package:anikki/core/widgets/anikki_action_button.dart';

class NewsAppBar extends StatelessWidget {
  const NewsAppBar({
    super.key,
    this.showTitle = true,
  });

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, newsState) {
        final isLoaded = newsState is NewsComplete;

        return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
            builder: (context, authState) {
          final isConnected = authState is AnilistAuthSuccess;
          final newsBloc = BlocProvider.of<NewsBloc>(context);

          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showTitle)
                  Text(
                    'News',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const AnikkiIcon(icon: Icons.calendar_month),
                    onPressed: () async {
                      showDateRangePicker(
                        context: context,
                        initialDateRange: NewsBloc.initalDateRange,
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 365)),
                        lastDate: DateTime.now().add(const Duration(days: 7)),
                      ).then((dateRange) {
                        if (dateRange == null) return;

                        final isOnline =
                            BlocProvider.of<ConnectivityBloc>(context).isOnline;

                        if (isOnline) {
                          dateRange = DateTimeRange(
                            start: dateRange.start,
                            end: dateRange.end.copyWith(
                              hour: 23,
                              minute: 59,
                              second: 59,
                            ),
                          );
                          BlocProvider.of<NewsBloc>(context).add(
                            NewsRequested(range: dateRange),
                          );
                        }
                      });
                    },
                  ),
                ),
                const NewsLayoutToggle(),
                AnikkiActionButton(
                  actions: newsOptionsActions(
                    isConnected,
                    isLoaded,
                    newsBloc,
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
