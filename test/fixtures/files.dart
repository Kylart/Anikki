import 'package:anikki/core/core.dart';

import 'anilist.dart';
import 'path.dart';

const emptyPath = '$path/empty';
const noPath = 'no/path';
const toAddPath =
    '$path/[SubsPlease] Kaminaki Sekai no Kamisama Katsudou - 04 (1080p) [0328F445].mkv';

final libraryEntries = [
  LibraryEntry(
    media: anilistMediaMock,
    entries: [
      LocalFile(
        path:
            '$path/[SubsPlease] Kimi wa Houkago Insomnia - 02 (1080p) [BC586D6A].mkv',
      ),
      LocalFile(
        path:
            '$path/[SubsPlease] Kimi wa Houkago Insomnia - 03 (1080p) [BC586D6A].mkv',
      ),
    ],
  ),
  LibraryEntry(
    media: anilistMediaMock,
    entries: [
      LocalFile(
        path:
            '$path/[SubsPlease] Kaminaki Sekai no Kamisama Katsudou - 03 (1080p) [0328F445].mkv',
      ),
    ],
  ),
  LibraryEntry(
    media: anilistMediaMock,
    entries: [
      LocalFile(
        path:
            '$path/[SubsPlease] Kuma Kuma Kuma Bear S2 - 04 (1080p) [67E8004E].mkv',
      ),
    ],
  ),
  LibraryEntry(
    media: anilistMediaMock,
    entries: [
      LocalFile(
        path:
            '$path/nested/[SubsPlease] NieR Automata Ver1 - 02 (1080p) [CC00E892].mkv',
      ),
    ],
  ),
];

final LocalFile mockFile = LocalFile(path: toAddPath);
final LibraryEntry mockEntry =
    LibraryEntry(media: anilistMediaMock, entries: [mockFile]);
