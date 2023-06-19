import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_episodes.dart';
import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_actions.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_trailer.dart';
import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';

class EntryCardOverlayMedia extends StatelessWidget {
  const EntryCardOverlayMedia({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        final isLoaded = state is LibraryLoaded;

        final libraryEntry = isLoaded
            ? state.entries.firstWhereOrNull(
                (element) =>
                    element.media?.anilistInfo.id == media.anilistInfo.id,
              )
            : null;

        return BlocBuilder<EntryCardOverlayBloc, EntryCardOverlayState>(
            builder: (context, state) {
          final isExpanded = (state as EntryCardOverlayActive).isExpanded;

          return LayoutCard(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
              ),
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
                    trailing: EntryTag(
                      padding: EdgeInsets.zero,
                      child: isExpanded
                          ? IconButton(
                              onPressed: () {
                                BlocProvider.of<EntryCardOverlayBloc>(context)
                                    .add(
                                  EntryCardOverlayClosed(),
                                );
                              },
                              icon: const Icon(Icons.close),
                            )
                          : IconButton(
                              onPressed: () {
                                BlocProvider.of<EntryCardOverlayBloc>(context)
                                    .add(
                                  EntryCardOverlayExpanded(context: context),
                                );
                              },
                              icon: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(pi),
                                child: const Icon(
                                  CupertinoIcons.arrow_up_left_arrow_down_right,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: EntryCardOverlayActions(
                      media: media.anilistInfo,
                      entry: libraryEntry,
                    ),
                  ),
                  if (media.anilistInfo.trailer?.id != null &&
                      media.anilistInfo.trailer?.site == 'youtube' &&
                      media.anilistInfo.trailer?.thumbnail != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: EntryCardOverlayTrailer(media: media),
                        ),
                      ),
                    )
                  else
                    const Spacer(),
                  if (media.anilistInfo.genres != null &&
                      media.anilistInfo.genres!.isNotEmpty)
                    Wrap(
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
                  if (isExpanded)
                    EntryCardOverlayEpisodes(
                      media: media,
                      entry: libraryEntry,
                    ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
