enum TorrentType {
  transmission,
  qbittorrent,
  none,
}

extension TorrentTypeName on TorrentType {
  String title() {
    switch (this) {
      case TorrentType.qbittorrent:
        return 'QBitTorrent';

      case TorrentType.transmission:
        return 'Transmission';

      case TorrentType.none:
        return 'None';
    }
  }
}
