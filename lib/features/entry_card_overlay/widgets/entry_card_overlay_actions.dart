import 'package:anikki/models/library_entry.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/features/entry_card_overlay/helpers/overlay_action.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/widgets/entry/entry_tag.dart';

class EntryCardOverlayActions extends StatelessWidget {
  const EntryCardOverlayActions({
    super.key,
    this.media,
    this.entry,
  });

  final Fragment$shortMedia? media;
  final LibraryEntry? entry;

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
                  entry == null
                      ? media
                      : entry!.entries.first.copyWith(episode: null),
                );
              }, context);
            },
            icon: const Icon(Icons.file_download_outlined),
          ),
        ),
        if (media?.siteUrl != null)
          EntryTag(
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: () {
                openInBrowser(media?.siteUrl);
              },
              icon: const Icon(SimpleIcons.anilist),
            ),
          ),
        if (media?.idMal != null)
          EntryTag(
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: () {
                if (media?.idMal == null) return;
                openInBrowser('https://myanimelist.net/anime/${media!.idMal!}');
              },
              icon: const Icon(SimpleIcons.myanimelist),
            ),
          ),
      ],
    );
  }
}
