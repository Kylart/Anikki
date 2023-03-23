import 'package:flutter/material.dart';

enum AnilistMediaListStatus {
  current,
  planning,
  completed,
  dropped,
  paused,
  repeating,
}

extension AnilistMediaListStatusLabel on AnilistMediaListStatus {
  String get label {
    switch (this) {
      case AnilistMediaListStatus.current:
        return 'Watching';
      case AnilistMediaListStatus.planning:
        return 'Planning';
      case AnilistMediaListStatus.completed:
        return 'Completed';
      case AnilistMediaListStatus.dropped:
        return 'Stopped';
      case AnilistMediaListStatus.paused:
        return 'Paused';
      case AnilistMediaListStatus.repeating:
        return 'Repeating';
    }
  }
}

extension AnilistMediaListStatusLDescription on AnilistMediaListStatus {
  String get descritpion {
    switch (this) {
      case AnilistMediaListStatus.current:
        return 'Currently watching';
      case AnilistMediaListStatus.planning:
        return 'Planning to watch';
      case AnilistMediaListStatus.completed:
        return 'Finished watching';
      case AnilistMediaListStatus.dropped:
        return 'Stopped watching before completing';
      case AnilistMediaListStatus.paused:
        return 'Paused watching';
      case AnilistMediaListStatus.repeating:
        return 'Re-watching';
    }
  }
}

final List<Tab> anilistMediaListStatusTabs = AnilistMediaListStatus.values
    .map(
      (status) => Tab(
        text: status.label,
      ),
    )
    .toList();
