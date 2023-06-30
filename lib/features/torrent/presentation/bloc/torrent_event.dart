part of 'torrent_bloc.dart';

abstract class TorrentEvent extends Equatable {
  const TorrentEvent();

  @override
  List<Object> get props => [];
}

class TorrentDataRequested extends TorrentEvent {}

class TorrentSettingsUpdated extends TorrentEvent {
  TorrentSettingsUpdated(
      {this.transmissionSettings, this.qBitTorrentSettings}) {
    assert(
      transmissionSettings != null || qBitTorrentSettings != null,
      'At least one setting type is required',
    );
  }

  final TransmissionSettings? transmissionSettings;
  final QBitTorrentSettings? qBitTorrentSettings;

  @override
  List<Object> get props => [
        if (transmissionSettings != null) transmissionSettings!,
        if (qBitTorrentSettings != null) qBitTorrentSettings!,
      ];
}

class TorrentPauseTorrent extends TorrentEvent {
  const TorrentPauseTorrent(this.torrent);

  final Torrent torrent;

  @override
  List<Object> get props => [torrent];
}

class TorrentStartTorrent extends TorrentEvent {
  const TorrentStartTorrent(this.torrent);

  final Torrent torrent;

  @override
  List<Object> get props => [torrent];
}

class TorrentRemoveTorrent extends TorrentEvent {
  const TorrentRemoveTorrent(this.torrent, [this.removeFile = false]);

  final Torrent torrent;
  final bool removeFile;

  @override
  List<Object> get props => [
        torrent,
        removeFile,
      ];
}

class TorrentAddTorrent extends TorrentEvent {
  const TorrentAddTorrent({
    required this.magnet,
    this.stream = true,
    this.callback,
  });

  final String magnet;
  final bool stream;
  final void Function(String path)? callback;

  @override
  List<Object> get props => [
        magnet,
        stream,
      ];
}
