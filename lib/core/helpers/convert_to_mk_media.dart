import 'package:media_kit/media_kit.dart' as mk;

import 'package:anikki/core/core.dart';

mk.Media convertToMkMedia(LocalFile file) {
  return mk.Media(
    file.path,
    extras: {
      'title': [
        file.media?.title ?? file.title ?? file.path,
        if (file.episode != null) 'Episode ${file.episode!}'
      ].join(' - '),
    },
  );
}
