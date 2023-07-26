import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/core/core.dart';

import '../../fixtures/path.dart';
import '../../helpers/init_hive.dart';
import '../../helpers/init_hydrated_storage.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  initHive();
  initHydratedStorage();

  group('unit test: Settings Bloc', () {
    late SettingsBloc bloc;
    const settings = Settings(
      localDirectory: path,
      newsLayout: NewsLayouts.list,
      userListLayouts: UserListLayouts.grid,
      theme: ThemeMode.system,
      torrentType: TorrentType.none,
      transmissionSettings: TransmissionSettings(),
      qBitTorrentSettings: QBitTorrentSettings(),
    );

    blocTest(
      'emits [SettingsState] when [SettingsUpdated] is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        const SettingsUpdated(settings),
      ),
      expect: () => [
        const SettingsState(settings),
      ],
      setUp: () {
        bloc = SettingsBloc(settings);
      },
    );

    blocTest(
      'emits [SettingsError] when [SettingsUpdateFailed] is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        const SettingsUpdateFailed(settings, 'error'),
      ),
      expect: () => [
        const SettingsError(settings, 'error'),
      ],
      setUp: () {
        bloc = SettingsBloc(settings);
      },
    );
  });
}
