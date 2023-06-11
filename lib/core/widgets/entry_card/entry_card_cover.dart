import 'package:flutter/material.dart';

import 'package:anikki/core/widgets/entry_card/entry_card_bookmark.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_completed.dart';

class EntryCardCover extends StatelessWidget {
  const EntryCardCover({
    super.key,
    required this.heroTag,
    this.coverImage,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  final String? coverImage;
  final String? episode;
  final String heroTag;
  final bool showBookmark;
  final bool showDone;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// Cover image or placeholder image
          if (coverImage != null)
            Hero(
              tag: heroTag,
              child: Image.network(
                coverImage!,
                fit: BoxFit.fill,
              ),
            )
          else
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/placeholder.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

          /// Show only if followed
          if (showBookmark)
            const Positioned(
              right: 10,
              top: 10,
              child: EntryCardBookmark(),
            ),

          /// Show if entry has been seen
          if (showDone)
            const Positioned(
              right: 10,
              top: 10,
              child: EntryCardCompleted(),
            ),

          /// Show episode
          if (episode != null)
            Positioned(
              right: 10,
              bottom: 10,
              child: EntryTag(
                color: Colors.black26,
                outline: Colors.transparent,
                child: Text(episode!),
              ),
            ),
        ],
      ),
    );
  }
}
