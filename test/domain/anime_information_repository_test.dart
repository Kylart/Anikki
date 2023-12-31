import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

import '../fixtures/anilist.dart';
import '../fixtures/files.dart';
import '../fixtures/nyaa.dart';

void main() {
  group('unit test: AnimeInformationRepository', () {
    late MockAnilist anilist;
    late MockNyaa nyaa;
    late AnimeInformationRepository repository;

    group('search method', () {
      group('with every request successful', () {
        var term = libraryEntries.first.entries.first.title!;

        setUp(() {
          nyaa = MockNyaa();
          when(() => nyaa.search(term)).thenAnswer(
            (_) async => torrentMocks,
          );

          anilist = MockAnilist();
          when(() => anilist.search(term)).thenAnswer(
            (_) async => searchResultMock,
          );

          repository = AnimeInformationRepository(anilist, nyaa);
        });

        test('returns the expected results', () async {
          final result = await repository.search(
            term,
            libraryEntries: libraryEntries,
          );

          expect(
            result.characters,
            searchResultMock[AnilistSearchPart.characters],
          );
          expect(result.staffs, searchResultMock[AnilistSearchPart.staffs]);
          expect(result.medias, searchResultMock[AnilistSearchPart.animes]);
          expect(result.torrents, torrentMocks);
          expect(result.term, term);
          expect(result.libraryEntries, [libraryEntries.first]);
        });
      });

      group('with only nyaa request failing', () {
        var term = libraryEntries.first.entries.first.title!;

        setUp(() {
          nyaa = MockNyaa();
          when(() => nyaa.search(term)).thenThrow(NyaaNoResultException());

          anilist = MockAnilist();
          when(() => anilist.search(term)).thenAnswer(
            (_) async => searchResultMock,
          );

          repository = AnimeInformationRepository(anilist, nyaa);
        });

        test('returns the expected results', () async {
          final result = await repository.search(
            term,
            libraryEntries: libraryEntries,
          );

          expect(
            result.characters,
            searchResultMock[AnilistSearchPart.characters],
          );
          expect(result.staffs, searchResultMock[AnilistSearchPart.staffs]);
          expect(result.medias, searchResultMock[AnilistSearchPart.animes]);
          expect(result.torrents, const []);
          expect(result.term, term);
          expect(result.libraryEntries, [libraryEntries.first]);
        });
      });

      group('with only anilist request failing', () {
        var term = libraryEntries.first.entries.first.title!;

        setUp(() {
          nyaa = MockNyaa();
          when(() => nyaa.search(term)).thenAnswer(
            (_) async => torrentMocks,
          );

          anilist = MockAnilist();
          when(() => anilist.search(term)).thenThrow(
            AnilistSearchException(error: 'error'),
          );

          repository = AnimeInformationRepository(anilist, nyaa);
        });

        test('returns the expected results', () async {
          final result = await repository.search(
            term,
            libraryEntries: libraryEntries,
          );

          expect(result.characters, const []);
          expect(result.staffs, const []);
          expect(result.medias, const []);
          expect(result.torrents, torrentMocks);
          expect(result.term, term);
          expect(result.libraryEntries, [libraryEntries.first]);
        });
      });

      group('with both anilist and nyaa request failing', () {
        var term = libraryEntries.first.entries.first.title!;

        setUp(() {
          nyaa = MockNyaa();
          when(() => nyaa.search(term)).thenThrow(NyaaNoResultException());

          anilist = MockAnilist();
          when(() => anilist.search(term)).thenThrow(
            AnilistSearchException(error: 'error'),
          );

          repository = AnimeInformationRepository(anilist, nyaa);
        });

        test('returns the expected results', () async {
          final result = await repository.search(
            term,
            libraryEntries: libraryEntries,
          );

          expect(result.characters, const []);
          expect(result.staffs, const []);
          expect(result.medias, const []);
          expect(result.torrents, const []);
          expect(result.term, term);
          expect(result.libraryEntries, [libraryEntries.first]);
        });
      });
    });
  });
}
