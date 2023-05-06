import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/helpers/capitalize.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry/entry_tag.dart';

class LibraryCardOverlay extends StatelessWidget {
  const LibraryCardOverlay({
    super.key,
    required this.entry,
  });

  final LibraryEntry entry;

  @override
  Widget build(BuildContext context) {
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title =
        entry.media?.title?.userPreferred ?? entry.entries.first.title ?? 'N/A';

    return Card(
      color: Theme.of(context).colorScheme.background.withOpacity(0.6),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      if (coverImage != null)
                        Image.network(
                          coverImage,
                          width: 125,
                        ),
                      if (entry.media?.source != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: EntryTag(
                            child: Text(
                              entry.media!.source!.name
                                  .capitalize()
                                  .replaceAll('_', ' '),
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ),
                      if (entry.media?.studios != null)
                        EntryTag(
                          child: Text(
                            entry.media!.studios!.nodes!.first!.name,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(
                            title,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            entry.media?.title?.native ?? '',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: entry.media?.genres != null &&
                                      entry.media!.genres!.isNotEmpty
                                  ? 110
                                  : 160,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                Bidi.stripHtmlIfNeeded(
                                    entry.media?.description ?? ''),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                        if (entry.media?.genres != null &&
                            entry.media!.genres!.isNotEmpty)
                          SizedBox(
                            height: entry.media!.genres!.length > 5 ? 60 : 30,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: 4.0,
                              spacing: 4.0,
                              children: entry.media!.genres!.map(
                                (genre) {
                                  return EntryTag(
                                    child: Text(
                                      genre.toString(),
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton.icon(
                      onPressed: () {
                        playFile(entry.entries.first, context);
                      },
                      label: const Text('Play'),
                      icon: const Icon(Icons.play_circle_outline),
                    ),
                    EntryTag(
                      padding: EdgeInsets.zero,
                      child: IconButton(
                        onPressed: () {
                          showAvailableTorrents(
                            context,
                            entry.entries.first.copyWith(episode: null),
                          );
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
                              'https://myanimelist.net/anime/${entry.media!.idMal}');
                        },
                        icon: const Icon(SimpleIcons.myanimelist),
                      ),
                    ),
                    EntryTag(
                      padding: EdgeInsets.zero,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
