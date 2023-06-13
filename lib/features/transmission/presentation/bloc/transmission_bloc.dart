import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/helpers/logger.dart';
import 'package:anikki/features/settings/domain/models/models.dart';
import 'package:anikki/features/transmission/domain/domain.dart';

part 'transmission_event.dart';
part 'transmission_state.dart';

class TransmissionBloc extends Bloc<TransmissionEvent, TransmissionState> {
  Timer? interval;

  TransmissionRepository transmission;

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
    on<TransmissionSettingsUpdated>(_onSettingsChanged);

    interval = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      if (!isClosed) add(TransmissionDataRequested());
    });
  }

  Future<void> _onDataRequested(
      TransmissionDataRequested event, Emitter<TransmissionState> emit) async {
    try {
      final torrents = await transmission.getTorrents();
      final loaded = TransmissionLoaded(torrents);

      emit(loaded.torrents.isEmpty ? TransmissionEmpty() : loaded);
    } catch (e) {
      emit(TransmissionCannotLoad());
    }
  }

  void _onSettingsChanged(
      TransmissionSettingsUpdated event, Emitter<TransmissionState> emit) {
    transmission = TransmissionRepository(
      uri: Uri(
        host: event.settings.host,
        port: event.settings.port,
        scheme: event.settings.scheme,
        path: 'transmission/rpc',
      ),
      username: event.settings.username,
      password: event.settings.password,
    );

    add(TransmissionDataRequested());
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
