enum TorrentType {
  transmission('Transmission'),
  qbittorrent('QBitTorrent'),
  none('None');

  final String title;

  const TorrentType(this.title);
}
