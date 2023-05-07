import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
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
    return BlocBuilder<EntryCardOverlayBloc, EntryCardOverlayState>(
        builder: (context, state) {
      final coverImage = entry.media?.coverImage?.extraLarge ??
          entry.media?.coverImage?.large ??
          entry.media?.coverImage?.medium;
      final title = entry.media?.title?.userPreferred ??
          entry.entries.first.title ??
          'N/A';

      return Card(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 125),
                        child: Column(
                          children: [
                            if (coverImage != null)
                              Image.network(
                                coverImage,
                              ),
                            if (entry.media?.source != null)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FilledButton.icon(
                                onPressed: () {
                                  playFile(entry.entries.first, context);
                                },
                                label: const Text('Play'),
                                icon: const Icon(Icons.play_circle_outline),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
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
                              if (entry.media?.genres != null &&
                                  entry.media!.genres!.isNotEmpty)
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4.0,
                                  spacing: 4.0,
                                  children: entry.media!.genres!.map(
                                    (genre) {
                                      return EntryTag(
                                        child: Text(
                                          genre.toString(),
                                          style:
                                              const TextStyle(fontSize: 10.0),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      final file =
                                          entry.entries.elementAt(index);

                                      return ListTile(
                                        dense: true,
                                        leading: IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.delete_outline),
                                          color: Colors.red,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.play_circle_outline),
                                        ),
                                        title: Text(
                                          file.episode == null
                                              ? file.title ??
                                                  basename(file.path)
                                              : 'Episode ${file.episode}',
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, index) =>
                                        const Divider(
                                      height: 1,
                                    ),
                                    itemCount: entry.entries.length,
                                  ),
                                ),
                              ),
                              LibraryCardOverlayActions(
                                entry: entry,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

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
      ],
    );
  }
}
