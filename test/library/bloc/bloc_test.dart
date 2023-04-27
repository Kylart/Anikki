import 'dart:io';

import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:anikki/features/library/repository/repository.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/models/local_file.dart';

import '../../helpers/init_hive.dart';
import '../../helpers/init_hydrated_storage.dart';

class MockLibraryRepository extends Mock implements LibraryRepository {}

class MockSettingsBloc extends Mock implements SettingsBloc {}

class MockLocalFile extends Mock implements LocalFile {}

void main() {
  initHive();
  initHydratedStorage();

  /// Shuts off logging except for errors
  Logger.level = Level.error;

  const path = 'test/resources/movies';
  const toAddPath =
      '$path/[SubsPlease] Kaminaki Sekai no Kamisama Katsudou - 04 (1080p) [0328F445].mkv';

  group('unit test: Library Bloc', () {
    late LibraryBloc bloc;
    late LibraryRepository repository;
    late SettingsBloc settingsBloc;

    late LocalFile mockFile;

    setUp(() {
      /// File mock
      mockFile = MockLocalFile();
      when(() => mockFile.path).thenReturn(toAddPath);
      when(() => mockFile.file).thenReturn(File(toAddPath));
      when(() => mockFile.title)
          .thenReturn('Kaminaki Sekai no Kamisama Katsudou');
      when(() => mockFile.episode).thenReturn(4);

      /// Repository mock
      repository = MockLibraryRepository();
      when(() => repository.getFile(toAddPath))
          .thenAnswer((_) async => mockFile);

      /// Settings Bloc mock
      settingsBloc = MockSettingsBloc();
      when(() => settingsBloc.stream).thenAnswer(
        (_) => const Stream<SettingsState>.empty(),
      );

      /// Instanciating bloc mock
      bloc = LibraryBloc(
        settingsBloc: settingsBloc,
        repository: repository,
      );
    });

    group('Event: [LibraryFileAdded]', () {
      blocTest<LibraryBloc, LibraryState>(
        'emit [LibraryLoaded] when [LibraryFileAdded] is added when no entry in [Library]',
        build: () => bloc,
        seed: () => const LibraryLoaded(
          id: 0,
          path: path,
          entries: [],
          expandedEntries: [],
        ),
        act: (bloc) => bloc.add(const LibraryFileAdded(path: toAddPath)),
        expect: () => [
          isA<LibraryLoaded>()
              .having(
                (p0) => p0.entries.length,
                'Has one entry',
                equals(1),
              )
              .having(
                (p0) => p0.entries.first.entries.first,
                'with the right file',
                equals(mockFile),
              )
              .having(
            (p0) => p0.expandedEntries,
            'Has expanded entries list',
            [true],
          ),
        ],
      );

      blocTest<LibraryBloc, LibraryState>(
        'emit [LibraryLoaded] when [LibraryFileAdded] is added when there are entries in [Library] but no entry with same name',
        build: () => bloc,
        seed: () => LibraryLoaded(
          id: 0,
          path: path,
          entries: [
            LibraryEntry(
              media: null,
              entries: [
                LocalFile(path: '$path/[SubsPlease] No name - 02.mkv'),
              ],
            )
          ],
          expandedEntries: const [true],
        ),
        act: (bloc) => bloc.add(const LibraryFileAdded(path: toAddPath)),
        expect: () => [
          isA<LibraryLoaded>()
              .having(
                (p0) => p0.entries.length,
                'has two entries',
                equals(2),
              )
              .having(
                (p0) => p0.entries.firstWhere(
                    (element) => element.entries.contains(mockFile)),
                'with the new file',
                isNotNull,
              )
              .having(
            (p0) => p0.expandedEntries,
            'with right expanded entries list',
            [true, true],
          ),
        ],
      );

      blocTest<LibraryBloc, LibraryState>(
        'emit [LibraryLoaded] when [LibraryFileAdded] is added when there are entries in [Library] and some with same name',
        build: () => bloc,
        seed: () => LibraryLoaded(
          id: 0,
          path: path,
          entries: [
            LibraryEntry(
              media: null,
              entries: [
                LocalFile(path: '$path/[SubsPlease] No name - 02.mkv'),
              ],
            ),
            LibraryEntry(
              media: null,
              entries: [
                LocalFile(
                    path:
                        '$path/[SubsPlease] Kaminaki Sekai no Kamisama Katsudou - 03 (1080p) [0328F445].mkv'),
              ],
            )
          ],
          expandedEntries: const [true, true],
        ),
        act: (bloc) => bloc.add(const LibraryFileAdded(path: toAddPath)),
        expect: () => [
          isA<LibraryLoaded>()
              .having(
                (p0) => p0.entries.length,
                'has two entries',
                equals(2),
              )
              .having(
                (p0) => p0.entries.firstWhere(
                    (element) => element.entries.contains(mockFile)),
                'with the new file',
                isNotNull,
              )
              .having(
                (p0) => p0.entries
                    .firstWhere((element) => element.entries.contains(mockFile))
                    .entries
                    .length,
                'grouped with the same name',
                equals(2),
              )
              .having(
            (p0) => p0.expandedEntries,
            'with right expanded entries list',
            [true, false],
          ),
        ],
      );
    });
  });
}
