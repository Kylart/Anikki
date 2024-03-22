import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_actions.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_episodes.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details_trailer.dart';

part 'media_details_genres.dart';

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
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        media.title ?? entry?.entries.first.title ?? 'N/A',
                      ),
                      subtitle: media.anilistInfo.title?.native == null
                          ? const SizedBox()
                          : Text(media.anilistInfo.title!.native!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton.outlined(
                      onPressed: () {
                        BlocProvider.of<LayoutBloc>(context).add(
                          const LayoutDrawerMediaChanged(),
                        );
                      },
                      icon: const Icon(Ionicons.chevron_forward_outline),
                    ),
                  ),
                ],
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
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MediaDetailsTrailer(
                    key: ValueKey(media.anilistInfo.id),
                    media: media,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 4.0),
                child: MediaDetailsGenres(
                  color: media.anilistInfo.coverImage?.color,
                  genres: media.anilistInfo.genres?.whereType<String>(),
                ),
              ),
              if (media.anilistInfo.description != null) ...[
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: HtmlWidget(
                    '<div style="text-align: justify">${media.anilistInfo.description!}</div>',
                  ),
                ),
                const Divider(height: 1),
              ],
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
