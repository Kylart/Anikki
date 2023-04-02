import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/news/helpers/news_actions.dart';
import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/helpers/anilist/filters/is_followed.dart';
import 'package:anikki/helpers/anilist/filters/is_seen.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key, required this.entry});

  final Query$AiringSchedule$Page$airingSchedules entry;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool showBookmark = false;
  bool showDone = false;

  WatchListComplete? listsState;

  @override
  void initState() {
    super.initState();

    final watchListBloc = BlocProvider.of<WatchListBloc>(context);

    watchListBloc.stream.listen((event) {
      if (event is WatchListComplete) {
        setState(() {
          listsState = event;
        });
      } else {
        setState(() {
          listsState = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final coverImage = widget.entry.media?.coverImage?.extraLarge ??
        widget.entry.media?.coverImage?.large ??
        widget.entry.media?.coverImage?.medium;
    final title = widget.entry.media?.title?.userPreferred ?? 'N/A';

    if (listsState != null) {
      setState(() {
        showBookmark = isFollowed(listsState!, widget.entry);

        if (isSeen(listsState!, widget.entry)) {
          showBookmark = false;
          showDone = true;
        }

        if (listsState!.completed.isNotEmpty && !showDone) {
          showDone = listsState!.completed
              .where((e) => e.media?.title?.userPreferred == title)
              .toList()
              .isNotEmpty;
        }
      });
    }

    return EntryCard(
      coverImage: coverImage,
      showBookmark: showBookmark,
      showDone: showDone,
      title: title,
      episode: widget.entry.episode.toString(),
      actions: getNewsActions(
        context: context,
        entry: widget.entry,
      ),
    );
  }
}
