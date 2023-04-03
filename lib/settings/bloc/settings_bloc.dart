import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:anikki/helpers/logger.dart';
import 'package:anikki/settings/models/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(
          const SettingsState(
            settings: Settings(
              localDirectory: '',
              newsLayout: NewsLayouts.list,
              userListLayouts: UserListLayouts.grid,
              theme: ThemeMode.system,
            ),
          ),
        ) {
    on<SettingsEvent>((event, emit) {
      logger.v('Settings event: ${event.runtimeType}');
    });

    on<SettingsUpdated>(_onUpdated);
    on<SettingsUpdateFailed>(_onUpdateFailed);
  }

  Future<void> _onUpdated(
      SettingsUpdated event, Emitter<SettingsState> emit) async {
    try {
      emit(SettingsState(settings: event.settings));
    } catch (e) {
      add(SettingsUpdateFailed(
          settings: event.settings, message: e.toString()));
    }
  }

  void _onUpdateFailed(
      SettingsUpdateFailed event, Emitter<SettingsState> emit) {
    emit(SettingsError(settings: event.settings, message: event.message));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState(
      settings: Settings.fromJson(
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
