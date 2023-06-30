import 'package:anikki/features/torrent/domain/domain.dart';

class EmptyRepository extends TorrentRepository {
  @override
  Future<Torrent> addTorrent(String magnet) {
    throw UnimplementedError();
  }

  @override
  Uri get defaultUri => Uri();

  @override
  Future<List<Torrent>> getTorrents() {
    throw UnimplementedError();
  }

  @override
  Future<void> login() {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTorrent(Torrent torrent, [bool deleteLocal = false]) {
    throw UnimplementedError();
  }

  @override
  Future<bool> startTorrent(Torrent torrent) {
    throw UnimplementedError();
  }

  @override
  Future<bool> stopTorrent(Torrent torrent) {
    throw UnimplementedError();
  }

  @override
  Future<bool> streamTorrent(Torrent torrent) {
    throw UnimplementedError();
  }
}
