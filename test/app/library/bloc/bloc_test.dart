import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

import '../../../fixtures/anilist.dart';
import '../../../fixtures/files.dart';
import '../../../fixtures/path.dart';
import '../../../helpers/init_hive.dart';
import '../../../helpers/init_hydrated_storage.dart';

class MockLocalStorageRepository extends Mock
    implements LocalStorageRepository {}

class MockLocalFile extends Mock implements LocalFile {}

void main() async {
  initHive();
  initHydratedStorage();

  group('unit test: Library Bloc', () {
    late LibraryBloc bloc;
    late MockLocalStorageRepository repository;

    group('Event: [LibraryUpdateRequested]', () {
      setUp(() {
        repository = MockLocalStorageRepository();

        when(() => repository.retrieveFilesAsLibraryEntries(emptyPath))
            .thenAnswer(
          (_) async => [],
        );
        when(() => repository.retrieveFilesAsLibraryEntries(path)).thenAnswer(
          (_) async => libraryEntries,
        );

        /// Instanciating bloc mock
        bloc = LibraryBloc(repository);
      });
      blocTest(
        'emits nothing when [LibraryUpdateRequested] is added with `null` path',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryUpdateRequested(path: null)),
        expect: () => [],
        verify: (bloc) {
          verifyNever(() => repository.retrieveFilesAsLibraryEntries(path));
        },
      );

      blocTest(
        'emits [LibraryLoading, LibraryLoaded] when [LibraryUpdateRequested] is added',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryUpdateRequested(path: path)),
        expect: () => [
          const LibraryLoading(path: path),
          isA<LibraryLoaded>().having(
            (p0) => p0.entries.length,
            'with the right number of entries',
            4,
          ),
        ],
        verify: (bloc) {
          verify(() => repository.retrieveFilesAsLibraryEntries(path))
              .called(1);
          expect(bloc.subscription, isNotNull);
        },
      );

      blocTest(
        'emits [LibraryLoading, LibraryEmpty] when [LibraryUpdateRequested] is added on empty directory',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryUpdateRequested(path: emptyPath)),
        expect: () => [
          const LibraryLoading(path: emptyPath),
          const LibraryEmpty(path: emptyPath),
        ],
        verify: (bloc) {
          verify(() => repository.retrieveFilesAsLibraryEntries(emptyPath))
              .called(1);
          expect(bloc.subscription, isNotNull);
        },
      );

      blocTest(
        'emits [LibraryLoading, LibraryError] when [LibraryUpdateRequested] is added on non-existing directory',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryUpdateRequested(path: noPath)),
        expect: () => [
          const LibraryLoading(path: noPath),
          isA<LibraryError>().having((p0) => p0.path, 'the right path', noPath),
        ],
        verify: (bloc) {
          verify(() => repository.retrieveFilesAsLibraryEntries(noPath))
              .called(1);
          expect(bloc.subscription, isNull);
        },
      );
    });

    group('Event: [LibraryFileAdded]', () {
      blocTest(
        'does nothing if state is not [LibraryLoaded]',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryFileAdded(path: toAddPath)),
        expect: () => [],
        setUp: () {
          repository = MockLocalStorageRepository();
          bloc = LibraryBloc(repository);
        },
      );

      blocTest<LibraryBloc, LibraryState>(
        'emit [LibraryLoaded] when [LibraryFileAdded] is added when no entry in [Library]',
        build: () => bloc,
        seed: () => const LibraryLoaded(
          id: 0,
          path: path,
          entries: [],
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
              ),
        ],
        setUp: () {
          repository = MockLocalStorageRepository();
          when(() => repository.addFileToEntries(const [], mockFile))
              .thenAnswer((_) => [mockEntry]);

          bloc = LibraryBloc(repository);
        },
      );

      blocTest<LibraryBloc, LibraryState>(
        'emit [LibraryLoaded] when [LibraryFileAdded] is added when there are entries in [Library] but no entry with same name',
        build: () => bloc,
        seed: () => LibraryLoaded(
          id: 0,
          path: path,
          entries: [libraryEntries.first],
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
              ),
        ],
        setUp: () {
          repository = MockLocalStorageRepository();
          when(
            () => repository.addFileToEntries([libraryEntries.first], mockFile),
          ).thenAnswer((_) => [libraryEntries.first, mockEntry]);

          bloc = LibraryBloc(repository);
        },
      );

      blocTest<LibraryBloc, LibraryState>(
        'emit [LibraryLoaded] when [LibraryFileAdded] is added when there are entries in [Library] and some with same name',
        build: () => bloc,
        seed: () => LibraryLoaded(
          id: 0,
          path: path,
          entries: libraryEntries.sublist(0, 2),
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
                (p0) => p0.entries
                    .firstWhere((element) => element.entries.contains(mockFile))
                    .entries
                    .first,
                'entries in the the right order',
                equals(mockFile),
              ),
        ],
        setUp: () {
          repository = MockLocalStorageRepository();
          when(
            () => repository.addFileToEntries(
                libraryEntries.sublist(0, 2), mockFile),
          ).thenAnswer(
            (_) => [
              libraryEntries.first,
              LibraryEntry(
                media: anilistMediaMock,
                entries: [
                  mockFile,
                  libraryEntries[1].entries.first,
                ],
              ),
            ],
          );

          bloc = LibraryBloc(repository);
        },
      );
    });

    group('Event: [LibraryFileDeleted]', () {
      blocTest(
        'does nothing if state is not [LibraryLoaded]',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryFileAdded(path: toAddPath)),
        expect: () => [],
        setUp: () {
          repository = MockLocalStorageRepository();
          bloc = LibraryBloc(repository);
        },
      );

      blocTest<LibraryBloc, LibraryState>(
        'emits [LibraryEmpty] after deleting a file alone in the only [LibraryEntry] available',
        build: () => bloc,
        seed: () => LibraryLoaded(
          path: path,
          entries: [libraryEntries.first],
        ),
        act: (bloc) => bloc.add(
          LibraryFileDeleted(file: mockFile),
        ),
        expect: () => [
          const LibraryEmpty(path: path),
        ],
        setUp: () {
          repository = MockLocalStorageRepository();
          when(
            () => repository
                .removeFileFromEntries([libraryEntries.first], mockFile),
          ).thenAnswer((_) => []);

          bloc = LibraryBloc(repository);
        },
      );

      blocTest<LibraryBloc, LibraryState>(
        'emits [LibraryLoaded] after deleting a file alone in its [LibraryEntry] but there are others',
        build: () => bloc,
        seed: () => LibraryLoaded(
          path: path,
          entries: libraryEntries,
        ),
        act: (bloc) => bloc.add(
          LibraryFileDeleted(file: libraryEntries.last.entries.first),
        ),
        expect: () => [
          isA<LibraryLoaded>().having(
            (p0) => p0.entries.length,
            'with ${libraryEntries.length - 1} entry remaining',
            equals(libraryEntries.length - 1),
          ),
        ],
        setUp: () {
          repository = MockLocalStorageRepository();
          when(
            () => repository.removeFileFromEntries(
                libraryEntries, libraryEntries.last.entries.first),
          ).thenAnswer(
              (_) => libraryEntries.sublist(0, libraryEntries.length - 1));

          bloc = LibraryBloc(repository);
        },
      );

      blocTest<LibraryBloc, LibraryState>(
        'emits [LibraryLoaded] after deleting a file not alone in its [LibraryEntry] but there are others',
        build: () => bloc,
        seed: () => LibraryLoaded(
          path: path,
          entries: libraryEntries,
        ),
        act: (bloc) => bloc
            .add(LibraryFileDeleted(file: libraryEntries.first.entries.first)),
        expect: () => [
          isA<LibraryLoaded>().having(
            (p0) => p0.entries.length,
            'with ${libraryEntries.length} entries still',
            equals(libraryEntries.length),
          ),
        ],
        setUp: () {
          repository = MockLocalStorageRepository();
          when(
            () => repository.removeFileFromEntries(
                libraryEntries, libraryEntries.first.entries.first),
          ).thenAnswer((_) => [
                LibraryEntry(
                  media: anilistMediaMock,
                  entries: [libraryEntries.first.entries.last],
                ),
                ...libraryEntries.sublist(1),
              ]);

          bloc = LibraryBloc(repository);
        },
      );
    });

    group('Event: [LibraryEntryExpanded]', () {
      blocTest(
        'does nothing if state is not [LibraryLoaded]',
        build: () => bloc,
        act: (bloc) => bloc.add(const LibraryFileAdded(path: toAddPath)),
        expect: () => [],
        setUp: () {
          repository = MockLocalStorageRepository();
          bloc = LibraryBloc(repository);
        },
      );
    });
  });
}
