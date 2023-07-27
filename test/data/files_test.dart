import 'package:anikki/core/core.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anikki/data/data.dart';
import 'package:path/path.dart';

import '../fixtures/path.dart';

void main() {
  group('unit test: Files', () {
    final repository = Files();

    group('getFilesInDirectory method', () {
      test('throws `LibraryDoesNotExistException` if directory does not exists',
          () async {
        try {
          await repository
              .getFilesInDirectory('/some/path/that/does/not/exist');
          fail('Expected exception');
        } catch (e) {
          expect(e, isA<LibraryDoesNotExistException>());
        }
      });

      test('returns the right file when directory exists', () async {
        final result = await repository.getFilesInDirectory(path);

        expect(result, isNotEmpty);
        expect(
            result.firstWhereOrNull(
                (element) => extension(element.path) == '.avi'),
            isNull);
      });
    });
  });
}
