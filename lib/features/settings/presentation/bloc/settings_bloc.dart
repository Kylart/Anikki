import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:anikki/features/settings/domain/models/models.dart';
import 'package:anikki/core/models/torrent_type.dart';
import 'package:anikki/core/helpers/logger.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc([Settings? settings])
      : super(
          SettingsState(
            settings ??
                const Settings(
                  localDirectory: '',
                  newsLayout: NewsLayouts.list,
                  userListLayouts: UserListLayouts.grid,
                  theme: ThemeMode.system,
                  torrentType: TorrentType.none,
                  transmissionSettings: TransmissionSettings(),
                  qBitTorrentSettings: QBitTorrentSettings(),
                ),
          ),
        ) {
    on<SettingsEvent>((event, emit) {
      logger.v('Settings event: ${event.runtimeType}');
    });

    on<SettingsUpdated>(_onUpdated);
    on<SettingsUpdateFailed>(_onUpdateFailed);

    /// Default to downloads directory if no directory
    if (state.settings.localDirectory.isEmpty) {
      getDownloadsDirectory().then(
        (downloadDir) {
          if (downloadDir != null) {
            add(SettingsUpdated(
                state.settings.copyWith(localDirectory: downloadDir.path)));
          }
        },
      );
    }
  }

  Future<void> _onUpdated(
      SettingsUpdated event, Emitter<SettingsState> emit) async {
    try {
      emit(SettingsState(event.settings));
    } catch (e) {
      add(
        SettingsUpdateFailed(
          event.settings,
          e.toString(),
        ),
      );
    }
  }

  void _onUpdateFailed(
      SettingsUpdateFailed event, Emitter<SettingsState> emit) {
    emit(SettingsError(event.settings, event.message));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState(
      Settings.fromJson(
        json['settings'],
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      'settings': state.settings.toJson(),
    };
  }
}
