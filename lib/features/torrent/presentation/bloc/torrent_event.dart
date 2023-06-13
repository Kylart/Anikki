part of 'torrent_bloc.dart';

abstract class TorrentEvent extends Equatable {
  const TorrentEvent();

  @override
  List<Object> get props => [];
}

class TorrentClientRequested extends TorrentEvent {
  const TorrentClientRequested(this.type);

  final TorrentType type;
}
