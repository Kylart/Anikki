import 'package:test/test.dart';
import 'package:nyaa/nyaa.dart';

void main() async {
  Nyaa nyaa = Nyaa();
  String term = 'subsplease bocchi';

  final result = await nyaa.search(term);

  group('Nyaa search', () {
    test('is a non empty array', () async {
      expect(
        result,
        allOf([
          anything,
          isList,
          isNotEmpty,
        ]),
      );
    });

    test('is made of Torrent objects', () {
      for (final torrent in result) {
        expect(
            torrent,
            allOf([
              anything,
              isA<Torrent>(),
            ]));
      }
    });

    test('has valid completed property', () {
      for (final torrent in result) {
        expect(torrent.completed, isNotNull);
        expect(int.tryParse(torrent.completed), isNotNull);
      }
    });

    test('has valid seeders property', () {
      for (final torrent in result) {
        expect(torrent.seeders, isNotNull);
        expect(int.tryParse(torrent.seeders), isNotNull);
      }
    });

    test('has valid leechers property', () {
      for (final torrent in result) {
        expect(torrent.leechers, isNotNull);
        expect(int.tryParse(torrent.leechers), isNotNull);
      }
    });

    test('has valid date property', () {
      for (final torrent in result) {
        expect(torrent.date, isNotNull);
      }
    });

    test('has valid filesize property', () {
      for (final torrent in result) {
        expect(torrent.filesize, isNotNull);
      }
    });

    test('has valid magnet property', () {
      for (final torrent in result) {
        expect(torrent.magnet, isNotNull);
        expect(torrent.magnet, startsWith('magnet'));
      }
    });

    test('has valid status property', () {
      for (final torrent in result) {
        expect(torrent.status, isNotNull);
      }
    });

    test('has valid parsed property', () {
      for (final torrent in result) {
        expect(torrent.parsed, isNotNull);
        expect(torrent.parsed.title, isNotNull);
      }
    });
  });
}
