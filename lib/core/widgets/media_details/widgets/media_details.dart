import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_actions.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_episodes.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_trailer.dart';

class MediaDetails extends StatelessWidget {
  const MediaDetails({
    super.key,
    required this.media,
    this.libraryEntry,
  });

  final Media media;
  final LibraryEntry? libraryEntry;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        final isLoaded = state is LibraryLoaded;

        final entry = libraryEntry ??
            (isLoaded
                ? state.entries.firstWhereOrNull(
                    (element) =>
                        element.media?.anilistInfo.id == media.anilistInfo.id,
                  )
                : null);

        return SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  media.title ?? entry?.entries.first.title ?? 'N/A',
                ),
                subtitle: media.anilistInfo.title?.native == null
                    ? const SizedBox()
                    : Text(media.anilistInfo.title!.native!),
                trailing: IconButton.outlined(
                  onPressed: () {
                    BlocProvider.of<LayoutBloc>(context).add(
                      const LayoutDrawerMediaChanged(),
                    );
                  },
                  icon: const Icon(Ionicons.chevron_forward_outline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MediaDetailsActions(
                  media: media,
                  entry: entry,
                ),
              ),
              if (media.anilistInfo.trailer?.id != null &&
                  media.anilistInfo.trailer?.site == 'youtube' &&
                  media.anilistInfo.trailer?.thumbnail != null)
                MediaDetailsTrailer(
                  key: ValueKey(media.anilistInfo.id),
                  media: media,
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
              MediaDetailsEpisodes(
                media: media,
                entry: entry,
              ),
            ],
          ),
        );
      },
    );
  }
}
