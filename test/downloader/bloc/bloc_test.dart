import 'package:anikki/core/core.dart';
import 'package:anikki/app/downloader/domain/domain.dart';
import 'package:anikki/app/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/anilist.dart';
import '../../fixtures/nyaa.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  group('unit test: Downloader Bloc', () {
    late DownloaderBloc bloc;
    late MockNyaa repository;
    late DownloaderFilter filter;
    late String term;

    setUp(() {
      filter = const DownloaderFilter(showAll: true);
      term = 'Sakura Trick';
    });

    group('with filter off', () {
      group('on DownloaderRequested', () {
        blocTest(
          'emits [DownloaderShow, DownloaderLoading, DownloaderSuccess] when [DownloaderRequested] is added',
          build: () => bloc,
          act: (bloc) => bloc.add(
            DownloaderRequested(media: shortMediaMock),
          ),
          expect: () => [
            DownloaderShow(term),
            DownloaderLoading(term),
            DownloaderSuccess(
              term: term,
              torrents: torrentMocks,
              filteredTorrents: torrentMocks,
              filter: filter,
              media: shortMediaMock,
            )
          ],
          setUp: () {
            repository = MockNyaa();

            when(() => repository.search(term)).thenAnswer(
              (invocation) async => torrentMocks,
            );

            bloc = DownloaderBloc(repository)..filter = filter;
          },
        );

        blocTest(
          'emits [DownloaderShow, DownloaderLoading, DownloaderSuccess] when [DownloaderRequested] is added but has no result',
          build: () => bloc,
          act: (bloc) => bloc.add(
            DownloaderRequested(media: shortMediaMock),
          ),
          expect: () => [
            DownloaderShow(term),
            DownloaderLoading(term),
            DownloaderSuccess(
              term: term,
              torrents: const [],
              filteredTorrents: const [],
              filter: filter,
              media: shortMediaMock,
            )
          ],
          setUp: () {
            repository = MockNyaa();

            when(() => repository.search(term)).thenAnswer(
              (invocation) async => [],
            );

            bloc = DownloaderBloc(repository)..filter = filter;
          },
        );

        blocTest(
          'emits [DownloaderShow, DownloaderLoading, DownloaderError] when [DownloaderRequested] is added but fails',
          build: () => bloc,
          act: (bloc) => bloc.add(
            DownloaderRequested(media: shortMediaMock),
          ),
          expect: () => [
            DownloaderShow(term),
            DownloaderLoading(term),
            DownloaderError(term: term, message: Exception('error').toString())
          ],
          setUp: () {
            repository = MockNyaa();

            when(() => repository.search(term)).thenThrow(Exception('error'));

            bloc = DownloaderBloc(repository)..filter = filter;
          },
        );
      });

      group('on DownloaderClosed', () {
        blocTest(
          'emits [DownloaderClose] when [DownloaderClosed] is added',
          build: () => bloc,
          act: (bloc) => bloc.add(
            const DownloaderClosed(),
          ),
          expect: () => [
            const DownloaderClose(),
          ],
          setUp: () {
            repository = MockNyaa();
            bloc = DownloaderBloc(repository)..filter = filter;
          },
        );
      });
    });

    group('with filter on', () {
      blocTest(
        'handles high quality accordingly',
        build: () => bloc,
        act: (bloc) => bloc.add(
          DownloaderRequested(media: shortMediaMock),
        ),
        expect: () => [
          DownloaderShow(term),
          DownloaderLoading(term),
          isA<DownloaderSuccess>().having(
            (p0) => p0.filteredTorrents,
            'with entries of only 1080p',
            allOf(
              isNotEmpty,
              hasLength(2),
            ),
          ),
        ],
        setUp: () {
          filter = const DownloaderFilter();

          repository = MockNyaa();

          when(() => repository.search(term)).thenAnswer(
            (invocation) async => torrentMocks,
          );

          bloc = DownloaderBloc(repository)..filter = filter;
        },
      );

      blocTest(
        'handles multiple quality accordingly',
        build: () => bloc,
        act: (bloc) => bloc.add(
          DownloaderRequested(media: shortMediaMock),
        ),
        expect: () => [
          DownloaderShow(term),
          DownloaderLoading(term),
          isA<DownloaderSuccess>().having(
            (p0) => p0.filteredTorrents,
            'with entries of 720p and 1080p',
            allOf(
              isNotEmpty,
              hasLength(4),
            ),
          ),
        ],
        setUp: () {
          filter = const DownloaderFilter(qualities: [
            Quality.high,
            Quality.medium,
          ]);

          repository = MockNyaa();

          when(() => repository.search(term)).thenAnswer(
            (invocation) async => torrentMocks,
          );

          bloc = DownloaderBloc(repository)..filter = filter;
        },
      );

      blocTest(
        'handles smartFilter accordingly by returning only the right entry',
        build: () => bloc,
        act: (bloc) => bloc.add(
          DownloaderRequested(
            media: shortMediaMock,
            episode: 1,
          ),
        ),
        expect: () => [
          DownloaderShow(term),
          DownloaderLoading(term),
          isA<DownloaderSuccess>()
              .having(
                (p0) => p0.filteredTorrents,
                'with only one of 1080p',
                allOf(
                  isNotEmpty,
                  hasLength(1),
                ),
              )
              .having(
                (p0) => p0.filteredTorrents.first.parsed.episode,
                'with the right entry',
                '01',
              ),
        ],
        setUp: () {
          term = 'Sakura Trick 1';
          filter = const DownloaderFilter(
            smartFilter: true,
          );

          repository = MockNyaa();

          when(() => repository.search(term)).thenAnswer(
            (invocation) async => torrentMocks,
          );

          bloc = DownloaderBloc(repository)..filter = filter;
        },
      );

      blocTest(
        'handles showAll accordingly by returning every entry',
        build: () => bloc,
        act: (bloc) => bloc.add(
          DownloaderRequested(media: shortMediaMock),
        ),
        expect: () => [
          DownloaderShow(term),
          DownloaderLoading(term),
          DownloaderSuccess(
            term: term,
            torrents: torrentMocks,
            filteredTorrents: torrentMocks,
            filter: filter,
            media: shortMediaMock,
          )
        ],
        setUp: () {
          filter = const DownloaderFilter(showAll: true);

          repository = MockNyaa();

          when(() => repository.search(term)).thenAnswer(
            (invocation) async => torrentMocks,
          );

          bloc = DownloaderBloc(repository)..filter = filter;
        },
      );

      blocTest(
        'handles more accordingly by returning every entry',
        build: () => bloc,
        act: (bloc) => bloc.add(
          DownloaderRequested(media: shortMediaMock),
        ),
        expect: () => [
          DownloaderShow(term),
          DownloaderLoading(term),
          isA<DownloaderSuccess>()
              .having(
                (p0) => p0.filteredTorrents,
                'with only one entry of SubsPlease',
                allOf(
                  isNotEmpty,
                  hasLength(1),
                ),
              )
              .having(
                (p0) => p0.filteredTorrents.first.parsed.releaseGroup,
                'with the right entry',
                'SubsPlease',
              ),
        ],
        setUp: () {
          filter = const DownloaderFilter(
            qualities: [],
            more: 'SubsPlease',
          );

          repository = MockNyaa();

          when(() => repository.search(term)).thenAnswer(
            (invocation) async => torrentMocks,
          );

          bloc = DownloaderBloc(repository)..filter = filter;
        },
      );
    });
  });
}
