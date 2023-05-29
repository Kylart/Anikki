import 'package:equatable/equatable.dart';
import 'package:qbittorrent/qbittorrent.dart';

class QBitTorrentWrapper extends Equatable {
  const QBitTorrentWrapper(this.qBitTorrent, this.isAuthorized);

  final QBitTorrent qBitTorrent;
  final bool isAuthorized;

  @override
  List<Object> get props => [
        qBitTorrent,
        isAuthorized,
      ];
}
