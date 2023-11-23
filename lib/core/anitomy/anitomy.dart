import 'package:anikki/core/anitomy/element_category.dart';
import 'package:anikki/core/anitomy/elements.dart';
import 'package:path/path.dart';

import 'anitomy_options.dart';
import 'anitomy_result.dart';
import 'tokens/tokens.dart';

class Anitomy {
  Anitomy({
    required this.options,
  });

  final AnitomyOptions options;

  AnitomyResult? parse(
    String filename, {
    AnitomyOptions options = AnitomyOptions.defaults,
  }) {
    // ignore: unused_local_variable
    const tokens = Tokens();
    final elements = Elements();

    elements.insert(ElementCategory.filename, filename);

    if (options.parseFileExtension) {
      // Maybe not enough, check with tests
      filename = basename(filename);

      elements.insert(
        ElementCategory.fileExtension,
        extension(filename).replaceFirst('.', ''),
      );
    }

    if (options.ignoredStrings.isNotEmpty) {
      for (final string in options.ignoredStrings) {
        filename = filename.replaceAll(string, '');
      }
    }

    if (filename.isEmpty) return null;

    return elements.toResult;
  }
}
