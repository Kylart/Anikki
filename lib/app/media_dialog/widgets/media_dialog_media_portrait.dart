import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_episodes.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_actions.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_trailer.dart';

class MediaDialogMediaPortrait extends StatelessWidget {
  const MediaDialogMediaPortrait({
    super.key,
    required this.media,
    this.libraryEntry,
  });

  final Media media;
  final LibraryEntry? libraryEntry;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<LibraryBloc, LibraryState>(
            builder: (context, state) {
              final isLoaded = state is LibraryLoaded;

              final entry = libraryEntry ??
                  (isLoaded
                      ? state.entries.firstWhereOrNull(
                          (element) =>
                              element.media?.anilistInfo.id ==
                              media.anilistInfo.id,
                        )
                      : null);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: AutoSizeText(
                        media.title ?? entry?.entries.first.title ?? 'N/A',
                        maxLines: 2,
                      ),
                      subtitle: media.anilistInfo.title?.native == null
                          ? const SizedBox()
                          : Text(media.anilistInfo.title!.native!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MediaDialogActions(
                        media: media,
                        entry: entry,
                        reversed: true,
                      ),
                    ),
                    if (media.anilistInfo.trailer?.id != null &&
                        media.anilistInfo.trailer?.site == 'youtube' &&
                        media.anilistInfo.trailer?.thumbnail != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: MediaDialogTrailer(media: media),
                          ),
                        ),
                      ),
                    if (media.anilistInfo.genres != null &&
                        media.anilistInfo.genres!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 4.0,
                          spacing: 4.0,
                          children:
                              media.anilistInfo.genres!.whereType<String>().map(
                            (genre) {
                              return EntryTag(
                                child: Text(
                                  genre,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    MediaDialogEpisodes(
                      media: media,
                      entry: entry,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
