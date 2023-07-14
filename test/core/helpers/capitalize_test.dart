import 'package:flutter_test/flutter_test.dart';
import 'package:anikki/core/core.dart';

void main() {
  group('unit test: capitalize', () {
    test('formats a lowercase word accordingly', () {
      expect('blabla'.capitalize(), 'Blabla');
    });

    test('formats a uppercase word accordingly', () {
      expect('BLABLA'.capitalize(), 'Blabla');
    });

    test('formats a random case word accordingly', () {
      expect('bLaBlA'.capitalize(), 'Blabla');
    });

    test('does not format an already fine word accordingly', () {
      expect('Blabla'.capitalize(), 'Blabla');
    });
  });
}
