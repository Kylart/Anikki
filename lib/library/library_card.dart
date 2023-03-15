import 'package:flutter/material.dart';

import 'package:anikki/components/entry_card/entry_card.dart';
import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/user_list/user_list_actions.dart';

class LocalCard extends StatelessWidget {
  const LocalCard({super.key, required this.entry});

  final LocalFile entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.title() ?? 'N/A';

    return EntryCard(
      coverImage: coverImage,
      title: title,
      episode: entry.episode?.toString(),
      actions: [
        EntryCardAction(
          callback: (context) {
            playFile(entry, context);
          },
          icon: Icons.play_arrow,
          label: 'Play file',
        ),
        EntryCardAction(
          callback: (context) {
            download<LocalFile>(context, entry);
          },
          icon: Icons.download,
          label: 'Show torrents',
        ),
        EntryCardAction(
          callback: (context) {
            openMediaInBrowser(entry.media?.siteUrl);
          },
          icon: Icons.open_in_new,
          label: 'See on Anilist',
        ),
        EntryCardAction(
          callback: (context) {
            deleteFile(entry, context);
          },
          icon: Icons.delete,
          label: 'Delete file',
        ),
      ],
    );
  }
}
