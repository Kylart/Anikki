import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/widgets/episode_list_no_media.dart';
import 'package:anikki/core/models/library_entry.dart';
import 'package:anikki/features/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/features/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/features/entry_card_overlay/helpers/overlay_action.dart';
import 'package:anikki/core/widgets/time_until_date.dart';
import 'package:anikki/features/entry_card_overlay/widgets/entry_card_overlay_file_tile.dart';
import 'package:anikki/features/library/bloc/library_bloc.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({
    super.key,
    required this.media,
    this.libraryEntry,
    this.fallbackEpisodeNumber = 0,
  });

  final Fragment$shortMedia media;
  final LibraryEntry? libraryEntry;
  final int fallbackEpisodeNumber;

  int get episodes => media.episodes ?? fallbackEpisodeNumber;
  bool get isAiring => media.nextAiringEpisode != null;
  List<int> get episodeList => List<int>.generate(
      isAiring ? media.nextAiringEpisode!.episode : episodes,
      (index) => index + 1).reversed.toList();

  Query$GetLists$MediaListCollection$lists$entries? getListEntryIfAny(
      BuildContext context) {
    Query$GetLists$MediaListCollection$lists$entries? listEntry;

    final isConnected = BlocProvider.of<AnilistAuthBloc>(context, listen: true)
        .state is AnilistAuthSuccess;
    final watchListBloc = BlocProvider.of<WatchListBloc>(context, listen: true);
    final hasLists = watchListBloc.state is WatchListComplete;

    if (isConnected && hasLists) {
      final lists = watchListBloc.state as WatchListComplete;

      for (final list in lists.watchList.values) {
        final match =
            list.firstWhereOrNull((element) => element.media?.id == media.id);

        if (match != null) {
          listEntry = match;
          break;
        }
      }
    }
    return listEntry;
  }

  @override
  Widget build(BuildContext context) {
    if (libraryEntry != null) {
      switch (media.format) {
        case Enum$MediaFormat.MOVIE:
        case Enum$MediaFormat.SPECIAL:
        case Enum$MediaFormat.OVA:
        case Enum$MediaFormat.ONA:
          return EpisodeListNoMedia(entry: libraryEntry!);
        default:
          break;
      }
    }

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final episodeNumber = episodeList.elementAt(index);
        final title = 'Episode $episodeNumber';
        final isNext = media.nextAiringEpisode?.episode == episodeNumber;

        if (isNext) {
          return ListTile(
            dense: true,
            title: Text(title),
            subtitle: TimeUntilDate(
              date: DateTime.fromMillisecondsSinceEpoch(
                media.nextAiringEpisode!.airingAt * 1000,
              ),
            ),
          );
        }

        final listEntry = getListEntryIfAny(context);

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
                (element) => media.format == Enum$MediaFormat.MOVIE
                    ? true
                    : element.episode == episodeNumber,
              ),
              listEntry: listEntry,
            );
          }
        }

        return ListTile(
          dense: true,
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (listEntry?.progress != null &&
                  listEntry!.progress! >= episodeNumber)
                const Icon(Icons.done),
              IconButton(
                onPressed: () {
                  overlayAction(
                    () => BlocProvider.of<DownloaderBloc>(context).add(
                      DownloaderRequested(
                        context: context,
                        media: media,
                        entry: libraryEntry,
                        episode: episodeNumber,
                      ),
                    ),
                    context,
                  );
                },
                icon: const Icon(Icons.file_download_outlined),
              ),
            ],
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
