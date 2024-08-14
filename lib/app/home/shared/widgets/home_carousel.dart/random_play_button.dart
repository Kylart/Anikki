import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

class RandomPlayButton extends StatelessWidget {
  const RandomPlayButton({
    super.key,
    required this.entries,
  });

  final List<Query$GetLists$MediaListCollection$lists$entries> entries;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final entry = entries.elementAt(
          Random().nextInt(entries.length - 1),
        );

        VideoPlayerRepository.playAnyway(
          context: context,
          media: entry.media,
          episode: (entry.progress ?? 0) + 1,
        );
      },
      icon: const Icon(Ionicons.shuffle_outline),
    );
  }
}
