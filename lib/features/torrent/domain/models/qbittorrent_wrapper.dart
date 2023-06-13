import 'package:equatable/equatable.dart';

import 'package:anikki/features/qbittorrent/domain/repository/repository.dart';

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
