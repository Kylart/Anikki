part of 'qbittorrent_bloc.dart';

abstract class QBitTorrentEvent extends Equatable {
  const QBitTorrentEvent();

  @override
  List<Object> get props => [];
}

class QBitTorrentDataRequested extends QBitTorrentEvent {}

class QBitTorrentPauseTorrent extends QBitTorrentEvent {
  const QBitTorrentPauseTorrent(this.hash);

  final String? hash;

  @override
  List<Object> get props => [if (hash != null) hash!];
}

class QBitTorrentStartTorrent extends QBitTorrentEvent {
  const QBitTorrentStartTorrent(this.hash);

  final String? hash;

  @override
  List<Object> get props => [if (hash != null) hash!];
}

class QBitTorrentRemoveTorrent extends QBitTorrentEvent {
  const QBitTorrentRemoveTorrent(this.hash, [this.removeFile = false]);

  final String? hash;
  final bool removeFile;

  @override
  List<Object> get props => [
        if (hash != null) hash!,
        removeFile,
      ];
}
