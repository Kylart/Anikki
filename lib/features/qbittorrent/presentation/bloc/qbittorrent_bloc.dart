import 'dart:async';

import 'package:anikki/features/settings/domain/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/helpers/logger.dart';
import 'package:anikki/features/qbittorrent/domain/domain.dart';

part 'qbittorrent_event.dart';
part 'qbittorrent_state.dart';

class QBitTorrentBloc extends Bloc<QBitTorrentEvent, QBitTorrentState> {
  Timer? interval;

  QBitTorrentRepository qBitTorrent;

  QBitTorrentBloc(this.qBitTorrent) : super(QBitTorrentInitial()) {
    on<QBitTorrentEvent>((event, emit) {
      if (event is! QBitTorrentDataRequested) {
        logger.v('QBitTorrent Event: ${event.runtimeType}');
      }
    });

    on<QBitTorrentDataRequested>(_onDataRequested);
    on<QBitTorrentPauseTorrent>(_onPauseTorrent);
    on<QBitTorrentStartTorrent>(_onStartTorrent);
    on<QBitTorrentRemoveTorrent>(_onRemoveTorrent);
    on<QBitTorrentSettingsUpdated>(_onSettingsChanged);

    interval = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) async {
        if (!isClosed) add(QBitTorrentDataRequested());
      },
    );
  }

  Future<void> _onDataRequested(
      QBitTorrentDataRequested event, Emitter<QBitTorrentState> emit) async {
    try {
      final torrents = await qBitTorrent.getTorrents();
      final loaded = QBitTorrentLoaded(torrents);

      emit(loaded.torrents.isEmpty ? QBitTorrentEmpty() : loaded);
    } catch (e) {
      emit(QBitTorrentCannotLoad());
    }
  }

  void _onSettingsChanged(
      QBitTorrentSettingsUpdated event, Emitter<QBitTorrentState> emit) {
    qBitTorrent = QBitTorrentRepository(
      uri: Uri(
        host: event.settings.host,
        port: event.settings.port,
        scheme: event.settings.scheme,
      ),
      username: event.settings.username,
      password: event.settings.password,
    );

    add(QBitTorrentDataRequested());
  }

  Future<void> _onPauseTorrent(
      QBitTorrentPauseTorrent event, Emitter<QBitTorrentState> emit) async {
    await qBitTorrent.pauseTorrent(event.hash);

    add(QBitTorrentDataRequested());
  }

  Future<void> _onStartTorrent(
      QBitTorrentStartTorrent event, Emitter<QBitTorrentState> emit) async {
    await qBitTorrent.resumeTorrent(event.hash);

    add(QBitTorrentDataRequested());
  }

  Future<void> _onRemoveTorrent(
      QBitTorrentRemoveTorrent event, Emitter<QBitTorrentState> emit) async {
    await qBitTorrent.deleteTorrent(event.hash, event.removeFile);

    add(QBitTorrentDataRequested());
  }
}
