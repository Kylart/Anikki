import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/settings/models/settings.dart';
import 'package:anikki/components/entry_tile.dart';
import 'package:anikki/news/helpers/news_actions.dart';
import 'package:anikki/news/widgets/news_card.dart';
import 'package:anikki/components/custom_list_view.dart';
import 'package:anikki/components/custom_grid_view.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key, required this.entries});

  final List<Query$AiringSchedule$Page$airingSchedules> entries;

  @override
  Widget build(BuildContext context) {
    final settings =
        BlocProvider.of<SettingsBloc>(context, listen: true).state.settings;

    return NewsLayouts.grid == settings.newsLayout
        ? CustomGridView(
            entries: entries,
            builder: (entry) => NewsCard(entry: entry),
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) => EntryTile(
              entry: entry,
              subtitle: Text(
                'Episode ${entry.episode}',
              ),
              actions: getNewsActions(
                context: context,
                entry: entry,
              ),
              title: entry.media?.title?.userPreferred,
              coverImage: entry.media?.coverImage?.extraLarge ??
                  entry.media?.coverImage?.large ??
                  entry.media?.coverImage?.medium,
              bannerImage: entry.media?.bannerImage,
              tags: entry.media?.genres?.whereType<String>().toList(),
              episode: entry.episode.toString(),
            ),
          );
  }
}
