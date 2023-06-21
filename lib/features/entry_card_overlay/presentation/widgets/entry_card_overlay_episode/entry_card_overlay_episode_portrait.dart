import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_episode/entry_card_overlay_episode.dart';
import 'package:anikki/features/library/domain/models/models.dart';

class EntryCardOverlayEpisodePortrait extends StatelessWidget {
  const EntryCardOverlayEpisodePortrait({
    super.key,
    required this.episodeCover,
    required this.info,
    required this.index,
    required this.isNextAiringEpisode,
    required this.aired,
    required this.media,
    required this.entry,
  });

  final String? episodeCover;
  final Fragment$shortMedia$streamingEpisodes? info;
  final int index;
  final bool isNextAiringEpisode;
  final bool aired;
  final Media media;
  final LibraryEntry? entry;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: episodeCover != null
          ? CircleAvatar(
              backgroundImage: (episodeCover == null
                  ? const AssetImage('assets/images/cover_placeholder.jpg')
                  : NetworkImage(episodeCover!)) as ImageProvider,
            )
          : null,
      title: EntryCardOverlayEpisodeTitle(
        info: info,
        index: index,
        textAlign: TextAlign.start,
      ),
      trailing: aired
          ? EntryCardOverlayEpisodeActions(
              media: media,
              index: index,
              entry: entry,
              info: info,
              mainAxisSize: MainAxisSize.min,
            )
          : Icon(isNextAiringEpisode
              ? Icons.access_time_outlined
              : Icons.unpublished_outlined),
      subtitle: isNextAiringEpisode
          ? const Text('Not aired yet')
          : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              EntryCardOverlayEpisodeCompleted(
                  media: media,
                  index: index,
                ),
            ],
          ),
    );
  }
}
