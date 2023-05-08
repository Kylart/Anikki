import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/helpers/overlay_action.dart';
import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_date.dart';
import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_file_tile.dart';
import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:anilist/anilist.dart';
import 'package:anikki/helpers/show_available_torrents.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({
    super.key,
    required this.media,
    this.fallbackEpisodeNumber = 0,
  });

  final Fragment$shortMedia media;
  final int fallbackEpisodeNumber;

  int get episodes => media.episodes ?? fallbackEpisodeNumber;
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
