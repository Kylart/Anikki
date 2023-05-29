import 'package:equatable/equatable.dart';

class QBitTorrentWrapper extends Equatable {
  const QBitTorrentWrapper(this.qBitTorrent, this.isAuthorized);

  final Object qBitTorrent;
  final bool isAuthorized;

  @override
  List<Object> get props => [
        qBitTorrent,
        isAuthorized,
      ];
}
