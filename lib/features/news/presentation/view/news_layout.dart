import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/news/presentation/widgets/news_tile.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/settings/models/settings.dart';
import 'package:anikki/features/news/presentation/widgets/news_card.dart';
import 'package:anikki/core/widgets/list_view/custom_list_view.dart';
import 'package:anikki/core/widgets/grid_view/custom_grid_view.dart';

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
            builder: (entry, index) => NewsCard(entry: entry),
          )
        : CustomListView(
            entries: entries,
            builder: (context, entry) => NewsTile(entry: entry),
          );
  }
}
