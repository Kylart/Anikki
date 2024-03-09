import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:anikki/core/core.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc([Settings? settings])
      : super(
          SettingsState(
            settings ?? const Settings(),
          ),
        ) {
    on<SettingsUpdated>(_onUpdated);
    on<SettingsUpdateFailed>(_onUpdateFailed);

    /// Default to downloads directory if no directory
    if (state.settings.librarySettings.path.isEmpty) {
      getDownloadsDirectory().then(
        (downloadDir) {
          if (downloadDir != null) {
            add(
              SettingsUpdated(
                state.settings.copyWith(
                  librarySettings: state.settings.librarySettings.copyWith(
                    path: downloadDir.path,
                  ),
                ),
              ),
            );
          }
        },
      );
    }
  }

  Future<void> _onUpdated(
    SettingsUpdated event,
    Emitter<SettingsState> emit,
  ) async {
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
    SettingsUpdateFailed event,
    Emitter<SettingsState> emit,
  ) {
    emit(
      SettingsError(
        event.settings,
        event.message,
      ),
    );
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
