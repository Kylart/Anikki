import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:transmission/transmission.dart';

import 'package:anikki/helpers/logger.dart';

part 'transmission_event.dart';
part 'transmission_state.dart';

class TransmissionBloc extends Bloc<TransmissionEvent, TransmissionState> {
  Timer? interval;

  Transmission transmission;

  TransmissionBloc(this.transmission) : super(TransmissionInitial()) {
    on<TransmissionEvent>((event, emit) {
      if (event is! TransmissionDataRequested) {
        logger.v('Transmission Event: ${event.runtimeType}');
      }
    });

    on<TransmissionDataRequested>(_onDataRequested);
    on<TransmissionPauseTorrent>(_onPauseTorrent);
    on<TransmissionStartTorrent>(_onStartTorrent);
    on<TransmissionRemoveTorrent>(_onRemoveTorrent);

    interval = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      add(TransmissionDataRequested());
    });
  }

  Future<void> _onDataRequested(
      TransmissionDataRequested event, Emitter<TransmissionState> emit) async {
    final torrents = await transmission.getTorrents();
    final loaded = TransmissionLoaded(torrents);

    emit(loaded.torrents.isEmpty ? TransmissionEmpty() : loaded);
  }

  Future<void> _onPauseTorrent(
      TransmissionPauseTorrent event, Emitter<TransmissionState> emit) async {
    await transmission.stopTorrent(event.id);

    add(TransmissionDataRequested());
  }

  Future<void> _onStartTorrent(
      TransmissionStartTorrent event, Emitter<TransmissionState> emit) async {
    await transmission.startTorrent(event.id);

    add(TransmissionDataRequested());
  }

  Future<void> _onRemoveTorrent(
      TransmissionRemoveTorrent event, Emitter<TransmissionState> emit) async {
    await transmission.removeTorrent(event.id, event.removeFile);

    add(TransmissionDataRequested());
  }
}
