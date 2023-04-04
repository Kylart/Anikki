import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/components/entry_tile.dart';
import 'package:anikki/helpers/anilist/filters/filters.dart';
import 'package:anikki/news/helpers/news_actions.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.entry});

  final Query$AiringSchedule$Page$airingSchedules entry;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;

    bool showBookmark = false;
    bool showDone = false;

    final state = BlocProvider.of<WatchListBloc>(context, listen: true).state;

    if (state is WatchListComplete) {
      final followed = isFollowed(state, entry);
      final seen = isSeen(state, entry);

      showBookmark = followed && !seen;
      showDone = seen;
    }

    return EntryTile(
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
      showBookmark: showBookmark,
      showDone: showDone,
    );
  }
}
