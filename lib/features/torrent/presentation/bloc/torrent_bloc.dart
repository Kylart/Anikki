import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

/// TODO: Rework Torrent feature to not use external domains
import 'package:anikki/core/providers/qbittorrent/qbittorrent.dart' as qbit;
import 'package:anikki/features/transmission/domain/domain.dart' as tr;

import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/torrent/domain/domain.dart';
import 'package:anikki/core/helpers/logger.dart';

part 'torrent_event.dart';
part 'torrent_state.dart';

class TorrentBloc extends Bloc<TorrentEvent, TorrentState> {
  final SettingsBloc settingsBloc;

  Timer? interval;

  TorrentBloc({required this.settingsBloc}) : super(const TorrentInitial()) {
    on<TorrentEvent>((event, emit) {
      logger.v('Torrent event: ${event.runtimeType}');
    });

    on<TorrentClientRequested>(_onClientRequested);

    _setUpInterval();
  }

  Future<void> _onClientRequested(
      TorrentClientRequested event, Emitter<TorrentState> emit) async {
    emit(
      TorrentLoading(
        transmissionWrapper: state.transmissionWrapper,
        qBitTorrentWrapper: state.qBitTorrentWrapper,
      ),
    );

    switch (event.type) {
      case TorrentType.transmission:
        await _searchForTransmission(emit);
        break;

      case TorrentType.qbittorrent:
        await _searchForQBitTorrent(emit);
        break;

      case TorrentType.none:
        break;
    }

    if (state is TorrentLoaded) {
      interval?.cancel();
      interval = null;
    } else {
      if (interval == null) {
        _setUpInterval();
      }

      emit(TorrentNotFound(
        transmissionWrapper: state.transmissionWrapper,
        qBitTorrentWrapper: state.qBitTorrentWrapper,
      ));
    }
  }

  void _setUpInterval() {
    interval = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        add(
          TorrentClientRequested(settingsBloc.state.settings.torrentType),
        );
      },
    );
  }

  Future<void> _searchForTransmission(Emitter<TorrentState> emit) async {
    final settings = settingsBloc.state.settings.transmissionSettings;

    final transmission = tr.Transmission(
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
    } on tr.UnauthorizedError {
      emit(TorrentLoaded(
        transmissionWrapper: TransmissionWrapper(transmission, false),
        qBitTorrentWrapper: state.qBitTorrentWrapper,
      ));
    } on tr.ConnectionRefusedError {
      emit(
        TorrentNotFound(
          transmissionWrapper: state.transmissionWrapper,
          qBitTorrentWrapper: state.qBitTorrentWrapper,
        ),
      );
    } on SocketException {
      emit(
        TorrentNotFound(
          transmissionWrapper: state.transmissionWrapper,
          qBitTorrentWrapper: state.qBitTorrentWrapper,
        ),
      );
    }
  }

  Future<void> _searchForQBitTorrent(Emitter<TorrentState> emit) async {
    final settings = settingsBloc.state.settings.qBitTorrentSettings;

    final qBitTorrent = qbit.QBitTorrent(
      uri: Uri(
        host: settings.host,
        port: settings.port,
        scheme: settings.scheme,
      ),
      username: settings.username,
      password: settings.password,
    );

    try {
      await qBitTorrent.login();

      emit(TorrentLoaded(
        transmissionWrapper: state.transmissionWrapper,
        qBitTorrentWrapper: QBitTorrentWrapper(qBitTorrent, true),
      ));
    } on qbit.UnauthorizedError {
      emit(TorrentLoaded(
        transmissionWrapper: state.transmissionWrapper,
        qBitTorrentWrapper: QBitTorrentWrapper(qBitTorrent, false),
      ));
    } on qbit.ConnectionRefusedError {
      emit(
        TorrentNotFound(
          transmissionWrapper: state.transmissionWrapper,
          qBitTorrentWrapper: state.qBitTorrentWrapper,
        ),
      );
    } on SocketException {
      emit(
        TorrentNotFound(
          transmissionWrapper: state.transmissionWrapper,
          qBitTorrentWrapper: state.qBitTorrentWrapper,
        ),
      );
    }
  }
}
