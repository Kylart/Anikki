part of 'torrent_bloc.dart';

abstract class TorrentState extends Equatable {
  const TorrentState();

  @override
  List<Object> get props => [];
}

class TorrentInitial extends TorrentState {}

class TorrentUnauthorized extends TorrentState {}

class TorrentEmpty extends TorrentState {}

class TorrentLoaded extends TorrentState {
  const TorrentLoaded(this.torrents);

  final List<Torrent> torrents;

  @override
  List<Object> get props => [torrents];
}

class TorrentCannotLoad extends TorrentState {}
