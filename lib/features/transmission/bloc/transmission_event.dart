part of 'transmission_bloc.dart';

abstract class TransmissionEvent extends Equatable {
  const TransmissionEvent();

  @override
  List<Object> get props => [];
}

class TransmissionDataRequested extends TransmissionEvent {}

class TransmissionPauseTorrent extends TransmissionEvent {
  const TransmissionPauseTorrent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class TransmissionStartTorrent extends TransmissionEvent {
  const TransmissionStartTorrent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class TransmissionRemoveTorrent extends TransmissionEvent {
  const TransmissionRemoveTorrent(this.id, [this.removeFile = false]);

  final int id;
  final bool removeFile;

  @override
  List<Object> get props => [id, removeFile];
}
