import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/core/core.dart';

import '../../../fixtures/path.dart';
import '../../../helpers/init_hive.dart';
import '../../../helpers/init_hydrated_storage.dart';

void main() {
  initHive();
  initHydratedStorage();

  group('unit test: Settings Bloc', () {
    late SettingsBloc bloc;
    const settings = Settings(
      isFirstLaunch: false,
      userListLayouts: UserListLayouts.grid,
      theme: ThemeMode.system,
      torrentType: TorrentType.none,
      librarySettings: LibrarySettings(path: path),
      transmissionSettings: TransmissionSettings(),
      qBitTorrentSettings: QBitTorrentSettings(),
      videoPlayerSettings: VideoPlayerSettings(),
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
