import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/news/domain/domain.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key, required this.entry});

  final NewsEntry entry;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool showBookmark = false;
  bool showDone = false;

  @override
  Widget build(BuildContext context) {
    final heroTag = 'news-${widget.entry.media.anilistInfo.id}';

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
      media: widget.entry.media,
      cover: EntryCardCover(
        coverImage: widget.entry.media.coverImage,
        showBookmark: showBookmark,
        showDone: showDone,
        episode: widget.entry.episode.toString(),
      ),
    );
  }
}
