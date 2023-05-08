import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anilist/anilist.dart';
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
                                  child: entry.media == null ||
                                          entry.media!.episodes == null
                                      ? EpisodeListNoMedia(
                                          entry: entry,
                                        )
                                      : EpisodeList(
                                          media: entry.media!,
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

void overlayAction(void Function() callback, BuildContext context) {
  callback();
  BlocProvider.of<EntryCardOverlayBloc>(context).add(EntryCardOverlayClosed());
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
                  'https://myanimelist.net/anime/${entry.media!.idMal}');
            },
            icon: const Icon(SimpleIcons.myanimelist),
          ),
        ),
      ],
    );
  }
}

class EpisodeList extends StatelessWidget {
  EpisodeList({super.key, required this.media}) {
    assert(media.episodes != null);
  }

  final Fragment$shortMedia media;

  int get episodes => media.episodes!;
  bool get isAiring => media.nextAiringEpisode != null;
  List<int> get episodeList => List<int>.generate(
      isAiring ? media.nextAiringEpisode!.episode : episodes,
      (index) => index + 1).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final episodeNumber = episodeList.elementAt(index);
        final title = 'Episode $episodeNumber';
        final isNext = media.nextAiringEpisode?.episode == episodeNumber;

        if (isNext) {
          return EntryCardOverlayDate(
            title: title,
            date: DateTime.fromMillisecondsSinceEpoch(
              media.nextAiringEpisode!.airingAt * 1000,
            ),
          );
        }

        final library =
            BlocProvider.of<LibraryBloc>(context, listen: true).state;

        if (library.runtimeType == LibraryLoaded) {
          final matches = (library as LibraryLoaded).entries.where(
                (element) =>
                    element.media?.id == media.id &&
                    element.entries
                        .where((f) => f.episode == episodeNumber)
                        .isNotEmpty,
              );

          if (matches.isNotEmpty) {
            return EntryCardOverlayFileTile(
              file: matches.first.entries.firstWhere(
                (element) => element.episode == episodeNumber,
              ),
            );
          }
        }

        return ListTile(
          dense: true,
          title: Text(title),
          trailing: IconButton(
            onPressed: () {
              overlayAction(
                () => showAvailableTorrents(
                  context,
                  media,
                  episodeNumber,
                ),
                context,
              );
            },
            icon: const Icon(Icons.file_download_outlined),
          ),
        );
      },
      separatorBuilder: (_, index) => const Divider(
        height: 1,
      ),
      itemCount: episodeList.length,
    );
  }
}

class EpisodeListNoMedia extends StatelessWidget {
  const EpisodeListNoMedia({
    super.key,
    required this.entry,
  });

  final LibraryEntry entry;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return EntryCardOverlayFileTile(
          file: entry.entries.elementAt(index),
        );
      },
      separatorBuilder: (_, index) => const Divider(
        height: 1,
      ),
      itemCount: entry.entries.length,
    );
  }
}

class EntryCardOverlayDate extends StatefulWidget {
  const EntryCardOverlayDate({
    super.key,
    required this.title,
    required this.date,
  });

  final String title;
  final DateTime date;

  @override
  State<EntryCardOverlayDate> createState() => _EntryCardOverlayDateState();
}

class _EntryCardOverlayDateState extends State<EntryCardOverlayDate> {
  late Timer timer;

  Duration timeUntil = Duration.zero;
  String get formattedTimeUntil {
    if (timeUntil.inDays != 0) {
      return '${timeUntil.inDays} days, ${timeUntil.inHours.remainder(60)} hours.';
    }
    if (timeUntil.inHours != 0) {
      return '${timeUntil.inHours.remainder(60)} hours, ${timeUntil.inMinutes.remainder(60)} minutes.';
    }

    return '${timeUntil.inMinutes.remainder(60)} minutes.';
  }

  @override
  void initState() {
    timeUntil = widget.date.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeUntil = widget.date.difference(DateTime.now());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(widget.title),
      subtitle: Text('Airing in $formattedTimeUntil'),
    );
  }
}

class EntryCardOverlayFileTile extends StatelessWidget {
  const EntryCardOverlayFileTile({
    super.key,
    required this.file,
  });

  final LocalFile file;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: IconButton(
        onPressed: () {
          overlayAction(
            () => deleteFile(file, context),
            context,
          );
        },
        icon: const Icon(Icons.delete_outline),
        color: Colors.red,
      ),
      trailing: IconButton(
        onPressed: () {
          overlayAction(
            () => playFile(file, context),
            context,
          );
        },
        icon: const Icon(Icons.play_circle_outline),
      ),
      title: Text(
        file.episode == null
            ? file.title ?? basename(file.path)
            : 'Episode ${file.episode}',
      ),
    );
  }
}
