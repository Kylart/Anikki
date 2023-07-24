import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/core/widgets/entry_card/entry_card.dart';
import 'package:anikki/domain/domain.dart';
import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';

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
    final state = BlocProvider.of<WatchListBloc>(context, listen: true).state;

    if (state is WatchListComplete) {
      final followed = UserListRepository.isFollowed(state, widget.entry);
      final seen = UserListRepository.isSeen(state, widget.entry);

      setState(() {
        showBookmark = followed && !seen;
        showDone = seen;
      });
    }

    return EntryCard(
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
