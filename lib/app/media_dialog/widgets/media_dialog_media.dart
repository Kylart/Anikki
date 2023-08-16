import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_episodes.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_actions.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_trailer.dart';

class MediaDialogMedia extends StatelessWidget {
  const MediaDialogMedia({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(builder: (context, state) {
      final isLoaded = state is LibraryLoaded;

      final libraryEntry = isLoaded
          ? state.entries.firstWhereOrNull(
              (element) =>
                  element.media?.anilistInfo.id == media.anilistInfo.id,
            )
          : null;

      return LayoutCard(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                title: AutoSizeText(
                  media.title ?? 'N/A',
                  maxLines: 2,
                ),
                subtitle: media.anilistInfo.title?.native == null
                    ? const SizedBox()
                    : Text(media.anilistInfo.title!.native!),
                trailing: IconButton.outlined(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MediaDialogActions(
                  media: media,
                  entry: libraryEntry,
                ),
              ),
              if (media.anilistInfo.trailer?.id != null &&
                  media.anilistInfo.trailer?.site == 'youtube' &&
                  media.anilistInfo.trailer?.thumbnail != null)
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 600,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
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
                    children: media.anilistInfo.genres!.whereType<String>().map(
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
                entry: libraryEntry,
              ),
            ],
          ),
        ),
      );
    });
  }
}
