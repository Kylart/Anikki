import 'package:anitomy/anitomy.dart';
import 'package:test/test.dart';

const name1 = '[Ouroboros]_Fullmetal_Alchemist_Brotherhood_01.mkv';
const name2 = '[Nyaa]_Sakura_Trick_2.mkv';
const name3 = '[Ouroboros]_Fullmetal_Alchemist_Brotherhood.mkv';

void main() {
  group('Can parse successfully', () {
    late Anitomy parser;

    setUp(() {
      parser = Anitomy(inputString: name1);
    });

    test('Gets the right title', () {
      final parser = Anitomy(inputString: name1);
      expect(parser.title, equals('Fullmetal Alchemist Brotherhood'));
    });
    test('Gets the right episode', () {
      expect(parser.episode, equals('01'));
    });
    test('Gets the right release group', () {
      expect(parser.releaseGroup, equals('Ouroboros'));
    });

    tearDown(() {
      parser.dispose();
    });
  });

  group('Give null if cannot parse a value', () {
    late Anitomy parser;

    setUp(() {
      parser = Anitomy(inputString: name3);
    });

    test('Returns null if cannot parse episode', () {
      expect(parser.episode, equals(null));
    });

    tearDown(() {
      parser.dispose();
    });
  });

  group('Can have multiple parser at the same time', () {
    late Anitomy parser1;
    late Anitomy parser2;

    setUp(() {
      parser1 = Anitomy(inputString: name1);
      parser2 = Anitomy(inputString: name2);
    });

    group('First parser', () {
      test('Gets the right title', () {
        expect(parser1.title, equals('Fullmetal Alchemist Brotherhood'));
      });
      test('Gets the right episode', () {
        expect(parser1.episode, equals('01'));
      });
      test('Gets the right release group', () {
        expect(parser1.releaseGroup, equals('Ouroboros'));
      });
    });

    group('Second parser', () {
      test('Gets the right title', () {
        expect(parser2.title, equals('Sakura Trick'));
      });
      test('Gets the right episode', () {
        expect(parser2.episode, equals('2'));
      });
      test('Gets the right release group', () {
        expect(parser2.releaseGroup, equals('Nyaa'));
      });
    });

    tearDown(() {
      parser1.dispose();
      parser2.dispose();
    });
  });
}
