part of 'qbittorrent_bloc.dart';

abstract class QBitTorrentState extends Equatable {
  const QBitTorrentState();

  @override
  List<Object> get props => [];
}

class QBitTorrentInitial extends QBitTorrentState {}

class QBitTorrentEmpty extends QBitTorrentState {}

class QBitTorrentLoaded extends QBitTorrentState {
  const QBitTorrentLoaded(this.torrents);

  final List<Torrent> torrents;

  @override
  List<Object> get props => [torrents];
}

class QBitTorrentCannotLoad extends QBitTorrentState {}
