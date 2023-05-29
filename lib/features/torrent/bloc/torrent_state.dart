part of 'torrent_bloc.dart';

abstract class TorrentState extends Equatable {
  const TorrentState({
    this.transmissionWrapper,
    this.qBitTorrentWrapper,
  });

  final TransmissionWrapper? transmissionWrapper;
  final QBitTorrentWrapper? qBitTorrentWrapper;

  @override
  List<Object> get props => [
        if (transmissionWrapper != null) transmissionWrapper!,
        if (qBitTorrentWrapper != null) qBitTorrentWrapper!,
      ];

  TorrentLoaded copyWith({
    TransmissionWrapper? transmissionWrapper,
    QBitTorrentWrapper? qBitTorrentWrapper,
  }) {
    return TorrentLoaded(
      transmissionWrapper: transmissionWrapper ?? this.transmissionWrapper,
      qBitTorrentWrapper: qBitTorrentWrapper ?? this.qBitTorrentWrapper,
    );
  }
}

class TorrentInitial extends TorrentState {
  const TorrentInitial({
    super.transmissionWrapper,
    super.qBitTorrentWrapper,
  });
}

class TorrentLoading extends TorrentState {
  const TorrentLoading({
    super.transmissionWrapper,
    super.qBitTorrentWrapper,
  });
}

class TorrentLoaded extends TorrentState {
  const TorrentLoaded({
    super.transmissionWrapper,
    super.qBitTorrentWrapper,
  });
}

class TorrentNotFound extends TorrentState {
  const TorrentNotFound({
    super.transmissionWrapper,
    super.qBitTorrentWrapper,
  });
}
