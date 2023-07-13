import 'package:anikki/core/core.dart';
import 'package:anitomy/anitomy.dart';
import 'package:mocktail/mocktail.dart';

class MockNyaa extends Mock implements Nyaa {}

final NyaaTorrent torrentMock = NyaaTorrent(
  id: '1051864',
  name: '[Tsundere] Sakura Trick - 01 [1080p]',
  date: '1530282871000',
  filesize: '8.2 GiB',
  magnet:
      'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
  torrent: 'nyaa.si/download/1051864.torrent',
  seeders: '37',
  leechers: '1',
  completed: '2923',
  status: 'success',
  parsed: Anitomy(
    inputString: '[Tsundere] Sakura Trick - 01 [1080p]',
  ),
);

final List<NyaaTorrent> torrentMocks = [
  NyaaTorrent(
    id: '1',
    name: '[Tsundere] Sakura Trick - 01 [1080p]',
    date: '1530282871000',
    filesize: '8.3 GiB',
    magnet:
        'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
    torrent: 'nyaa.si/download/1051865.torrent',
    seeders: '32',
    leechers: '1',
    completed: '2923',
    status: 'success',
    parsed: Anitomy(
      inputString: '[Tsundere] Sakura Trick - 01 [1080p]',
    ),
  ),
  NyaaTorrent(
    id: '2',
    name: '[Tsundere] Sakura Trick - 01 [720p]',
    date: '1530282871000',
    filesize: '8.3 GiB',
    magnet:
        'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
    torrent: 'nyaa.si/download/1051865.torrent',
    seeders: '32',
    leechers: '1',
    completed: '2923',
    status: 'success',
    parsed: Anitomy(
      inputString: '[Tsundere] Sakura Trick - 01 [720p]',
    ),
  ),
  NyaaTorrent(
    id: '3',
    name: '[Tsundere] Sakura Trick - 02 [1080p]',
    date: '1530282871000',
    filesize: '8.2 GiB',
    magnet:
        'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
    torrent: 'nyaa.si/download/1051865.torrent',
    seeders: '38',
    leechers: '2',
    completed: '2924',
    status: 'success',
    parsed: Anitomy(
      inputString: '[Tsundere] Sakura Trick - 02 [1080p]',
    ),
  ),
  NyaaTorrent(
    id: '4',
    name: '[Tsundere] Sakura Trick - 02 [720p]',
    date: '1530282871000',
    filesize: '8.2 GiB',
    magnet:
        'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
    torrent: 'nyaa.si/download/1051865.torrent',
    seeders: '38',
    leechers: '2',
    completed: '2924',
    status: 'success',
    parsed: Anitomy(
      inputString: '[Tsundere] Sakura Trick - 02 [720p]',
    ),
  ),
  NyaaTorrent(
    id: '5',
    name: '[Tsundere] Sakura Trick - 02',
    date: '1530282871000',
    filesize: '8.2 GiB',
    magnet:
        'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
    torrent: 'nyaa.si/download/1051865.torrent',
    seeders: '38',
    leechers: '2',
    completed: '2924',
    status: 'success',
    parsed: Anitomy(
      inputString: '[Tsundere] Sakura Trick - 02',
    ),
  ),
  NyaaTorrent(
    id: '6',
    name: '[SubsPlease] Sakura Trick',
    date: '1530282871000',
    filesize: '8.2 GiB',
    magnet:
        'magnet:?xt=urn:btih: 5fb5ffd5948894bfc9b852f4e466c47c3f4f84ed&dn=%5BTsundere%5D%20Sakura%20Trick%20%5BBDRip%20h264%201920x1080%2010bit%20FLAC%5D&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce',
    torrent: 'nyaa.si/download/1051865.torrent',
    seeders: '38',
    leechers: '2',
    completed: '2924',
    status: 'success',
    parsed: Anitomy(
      inputString: '[SubsPlease] Sakura Trick',
    ),
  ),
];
