import 'package:anikki/core/core.dart';
import 'package:http/http.dart' as http;

export 'transmission_repository.dart';
export 'qbittorrent_repository.dart';
export 'empty_repository.dart';

abstract class TorrentRepository {
  TorrentRepository({
    Uri? uri,
    this.username,
    this.password,
    http.Client? client,
  }) {
    this.uri = uri ?? defaultUri;
    this.client = client ?? http.Client();
  }

  final String? username;
  final String? password;

  late final http.Client client;
  late final Uri uri;

  Uri get defaultUri;

  bool get hasCredentials =>
      username != null &&
      username!.isNotEmpty &&
      password != null &&
      password!.isNotEmpty;

  Future<void> login();

  Future<List<Torrent>> getTorrents();

  Future<Torrent> addTorrent(String magnet);

  Future<bool> stopTorrent(Torrent torrent);

  Future<bool> startTorrent(Torrent torrent);

  Future<bool> removeTorrent(Torrent torrent, [bool deleteLocal = false]);

  Future<bool> streamTorrent(Torrent torrent);
}
