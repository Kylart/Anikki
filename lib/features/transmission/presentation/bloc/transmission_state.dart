part of 'transmission_bloc.dart';

abstract class TransmissionState extends Equatable {
  const TransmissionState();

  @override
  List<Object> get props => [];
}

class TransmissionInitial extends TransmissionState {}

class TransmissionEmpty extends TransmissionState {}

class TransmissionLoaded extends TransmissionState {
  const TransmissionLoaded(this.torrentGet);

  final TorrentGet torrentGet;

  List<Torrent> get torrents => torrentGet.arguments?.torrents ?? [];

  @override
  List<Object> get props => [torrentGet];
}

class TransmissionCannotLoad extends TransmissionState {}
