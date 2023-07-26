import 'dart:io';

import 'package:anikki/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anikki/core/core.dart';
import 'package:path/path.dart';

import '../fixtures/anilist.dart';
import '../fixtures/files.dart';
import '../fixtures/path.dart';

void main() {
  group('unit test: LocalStorageRepository', () {
    late MockAnilist anilist;
    late MockFiles files;
    late LocalStorageRepository repository;

    group('deleteFile method', () {
      late LocalFile file;

      final tmpPath = join(path, 'tmp');

      setUp(() async {
        await File(tmpPath).create();

        file = LocalFile(path: tmpPath);

        anilist = MockAnilist();
        files = MockFiles();
        repository = LocalStorageRepository(anilist, files);
      });

      test('deletes the file', () async {
        await repository.deleteFile(file);

        expect(await File(tmpPath).exists(), isFalse);
      });

      tearDown(() async {
        final file = File(tmpPath);

        if (await file.exists()) await file.delete();
      });
    });
  });
}
