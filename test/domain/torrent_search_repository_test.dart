import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';
import '../fixtures/files.dart';
import '../fixtures/nyaa.dart';

void main() {
  group('unit test: TorrentSearchRepository', () {
    late MockNyaa nyaa;
    late TorrentSearchRepository repository;

    group('searchNyaa method', () {
      const term = 'Sakura Trick';

      group('when API succeeds', () {
        setUp(() {
          nyaa = MockNyaa();
          when(() => nyaa.search(term)).thenAnswer((_) async => torrentMocks);

          repository = TorrentSearchRepository(nyaa);
        });

        test('returns the right result', () async {
          final result = await repository.searchNyaa(term);

          expect(result, torrentMocks);
        });
      });

      group('when API fails', () {
        final exception = Exception('error');

        setUp(() {
          nyaa = MockNyaa();
          when(() => nyaa.search(term)).thenThrow(exception);

          repository = TorrentSearchRepository(nyaa);
        });

        test('returns the same exception', () async {
          try {
            await repository.searchNyaa(term);
            fail('Expected exception');
          } on Exception catch (e) {
            expect(e, exception);
          }
        });
      });
    });

    group('makeTerm method', () {
      final media = anilistMediaMock;
      const episode = 1;
      const title = 'Danmachi';
      final entry = libraryEntries.first;

      setUp(() {
        nyaa = MockNyaa();
        repository = TorrentSearchRepository(nyaa);
      });

      test('with only media', () {
        final result = repository.makeTerm(media: media);

        expect(result, media.anilistInfo.title?.userPreferred);
      });

      test('with media and episode', () {
        final result = repository.makeTerm(
          media: media,
          episode: episode,
        );

        expect(result, '${media.anilistInfo.title?.userPreferred} $episode');
      });

      test('with media and entry', () {
        final result = repository.makeTerm(
          media: media,
          entry: entry,
        );

        expect(result, entry.entries.first.title);
      });

      test('with media, entry and title', () {
        final result = repository.makeTerm(
          media: media,
          entry: entry,
          title: title,
        );

        expect(result, title);
      });

      test('with nothing', () {
        final result = repository.makeTerm();

        expect(result, '');
      });
    });
  });
}
