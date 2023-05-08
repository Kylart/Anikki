import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/features/entry_card_overlay/helpers/overlay_action.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry/entry_tag.dart';

class LibraryCardOverlayActions extends StatelessWidget {
  const LibraryCardOverlayActions({super.key, required this.entry});

  final LibraryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              overlayAction(() {
                showAvailableTorrents(
                  context,
                  entry.entries.first.copyWith(episode: null),
                );
              }, context);
            },
            icon: const Icon(Icons.file_download_outlined),
          ),
        ),
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              openInBrowser(entry.media?.siteUrl);
            },
            icon: const Icon(SimpleIcons.anilist),
          ),
        ),
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              if (entry.media?.idMal == null) return;
              openInBrowser(
                  'https://myanimelist.net/anime/${entry.media?.idMal}');
            },
            icon: const Icon(SimpleIcons.myanimelist),
          ),
        ),
      ],
    );
  }
}
