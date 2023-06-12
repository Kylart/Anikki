import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/library/domain/models/models.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/episode_list.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/episode_list_no_media.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_actions.dart';
import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class EntryCardOverlayMedia extends StatelessWidget {
  EntryCardOverlayMedia({
    super.key,
    required this.media,
    this.isLibrary = false,
    this.entry,
    this.fallbackEpisodeNumber = 0,
  }) {
    if (isLibrary) assert(entry != null);
  }

  final Fragment$shortMedia? media;
  final bool isLibrary;
  final LibraryEntry? entry;
  final int fallbackEpisodeNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryCardOverlayBloc, EntryCardOverlayState>(
        builder: (context, state) {
      final coverImage = media?.coverImage?.extraLarge ??
          media?.coverImage?.large ??
          media?.coverImage?.medium;
      final title =
          media?.title?.userPreferred ?? entry?.entries.first.title ?? 'N/A';

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
                            if (media?.source != null)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: EntryTag(
                                  child: Text(
                                    media!.source!.name
                                        .capitalize()
                                        .replaceAll('_', ' '),
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ),
                            if (media?.studios != null &&
                                media!.studios!.nodes!.isNotEmpty)
                              EntryTag(
                                child: Text(
                                  media!.studios!.nodes!.first!.name,
                                  style: const TextStyle(fontSize: 12.0),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            const Spacer(),
                            if (isLibrary)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FilledButton.icon(
                                  onPressed: () {
                                    BlocProvider.of<LibraryBloc>(context).add(
                                      LibraryFilePlayRequested(
                                        file: entry!.entries.first,
                                        context: context,
                                      ),
                                    );
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
                                title: AutoSizeText(
                                  title,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  media?.title?.native ?? '',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              if (media?.genres != null &&
                                  media!.genres!.isNotEmpty)
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4.0,
                                  spacing: 4.0,
                                  children: media!.genres!.map(
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
                                  child: media == null || media?.id == 0
                                      ? EpisodeListNoMedia(
                                          entry: entry!,
                                        )
                                      : EpisodeList(
                                          media: media!,
                                          libraryEntry: entry,
                                          fallbackEpisodeNumber:
                                              fallbackEpisodeNumber,
                                        ),
                                ),
                              ),
                              EntryCardOverlayActions(
                                entry: entry,
                                media: media,
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
