import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/news/domain/domain.dart';
import 'package:anikki/core/widgets/time_until_date.dart';
import 'package:anikki/core/widgets/entry/entry_tile.dart';
import 'package:anikki/features/anilist_watch_list/presentation/bloc/watch_list_bloc.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.entry});

  final NewsEntry entry;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool showBookmark = false;
  bool showDone = false;

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;

    final state = BlocProvider.of<WatchListBloc>(context, listen: true).state;

    if (state is WatchListComplete) {
      final followed = isFollowed(state, entry);
      final seen = isSeen(state, entry);

      setState(() {
        showBookmark = followed && !seen;
        showDone = seen;
      });
    }

    return EntryTile(
      media: entry.media,
      subtitle: Row(
        children: [
          Text(
            'Episode ${entry.episode} - ',
          ),
          TimeUntilDate(
            date: widget.entry.airingAt,
          )
        ],
      ),
      episode: entry.episode.toString(),
      showBookmark: showBookmark,
      showDone: showDone,
    );
  }
}
