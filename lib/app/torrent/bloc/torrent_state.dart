part of 'torrent_bloc.dart';

sealed class TorrentState extends Equatable {
  const TorrentState();

  @override
  List<Object> get props => [];
}

final class TorrentInitial extends TorrentState {}

final class TorrentUnauthorized extends TorrentState {}

final class TorrentEmpty extends TorrentState {}

final class TorrentLoaded extends TorrentState {
  const TorrentLoaded(this.torrents);

  final List<Torrent> torrents;

  @override
  List<Object> get props => [torrents];
}

final class TorrentCannotLoad extends TorrentState {}
