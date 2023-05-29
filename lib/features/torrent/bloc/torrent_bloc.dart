import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:transmission/transmission.dart';

import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/torrent/models/qbittorrent_wrapper.dart';
import 'package:anikki/features/torrent/models/transmission_wrapper.dart';
import 'package:anikki/features/torrent/helpers/torrent_type.dart';
import 'package:anikki/helpers/logger.dart';

part 'torrent_event.dart';
part 'torrent_state.dart';

class TorrentBloc extends Bloc<TorrentEvent, TorrentState> {
  final SettingsBloc settingsBloc;

  TorrentBloc({required this.settingsBloc}) : super(const TorrentInitial()) {
    on<TorrentEvent>((event, emit) {
      logger.v('Torrent event: ${event.runtimeType}');
    });

    on<TorrentClientRequested>((event, emit) async {
      if (event.type == TorrentType.transmission) {
        emit(
          TorrentLoading(
            transmissionWrapper: state.transmissionWrapper,
            qBitTorrentWrapper: state.qBitTorrentWrapper,
          ),
        );

        await _searchForTransmission(emit);
      }
    });
  }

  Future<void> _searchForTransmission(Emitter<TorrentState> emit) async {
    final settings = settingsBloc.state.settings.transmissionSettings;

    final transmission = Transmission(
      uri: Uri(
        host: settings.host,
        port: settings.port,
        scheme: settings.scheme,
        path: 'transmission/rpc',
      ),
      username: settings.username,
      password: settings.password,
    );

    try {
      await transmission.getSession();

      emit(TorrentLoaded(
        transmissionWrapper: TransmissionWrapper(transmission, true),
        qBitTorrentWrapper: state.qBitTorrentWrapper,
      ));
    } on UnauthorizedError {
      emit(TorrentLoaded(
        transmissionWrapper: TransmissionWrapper(transmission, false),
        qBitTorrentWrapper: state.qBitTorrentWrapper,
      ));
    } on ConnectionRefusedError {
      emit(
        TorrentNotFound(
          transmissionWrapper: state.transmissionWrapper,
          qBitTorrentWrapper: state.qBitTorrentWrapper,
        ),
      );
    }
  }
}
