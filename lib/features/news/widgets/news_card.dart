import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/widgets/entry_card/entry_card.dart';
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

  @override
  Widget build(BuildContext context) {
    final heroTag = 'news-${widget.entry.id}';
    final coverImage = widget.entry.media?.coverImage?.extraLarge ??
        widget.entry.media?.coverImage?.large ??
        widget.entry.media?.coverImage?.medium;

    final state = BlocProvider.of<WatchListBloc>(context, listen: true).state;

    if (state is WatchListComplete) {
      final followed = isFollowed(state, widget.entry);
      final seen = isSeen(state, widget.entry);

      setState(() {
        showBookmark = followed && !seen;
        showDone = seen;
      });
    }

    return EntryCard(
      heroTag: heroTag,
      media: widget.entry.media!,
      cover: EntryCardCover(
        heroTag: heroTag,
        coverImage: coverImage,
        showBookmark: showBookmark,
        showDone: showDone,
        episode: widget.entry.episode.toString(),
      ),
    );
  }
}
