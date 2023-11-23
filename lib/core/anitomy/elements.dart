import 'package:anikki/core/anitomy/anitomy_result.dart';
import 'package:anikki/core/anitomy/element_category.dart';

import 'keyword/keyword.dart';

class Elements {
  Elements();

  final checkAltNumber = false;
  Map<ElementCategory, List<String>> elements = {};

  void insert(ElementCategory category, String keyword) {
    if (elements[category] == null) {
      elements[category] = [keyword];
    } else {
      elements[category]!.add(keyword);
    }
  }

  void erase(ElementCategory category) {
    elements.remove(category);
  }

  void remove(ElementCategory category, Keyword keyword) {
    // TODO
    // ignore: list_remove_unrelated_type
    elements[category]?.remove(keyword);

    if (elements[category]?.isEmpty == true) erase(category);
  }

  bool contains(ElementCategory category) {
    return elements.keys.contains(category) &&
        elements[category]?.isNotEmpty == true;
  }

  bool get isEmpty => elements.isEmpty;

  List<String> get(ElementCategory category) {
    return elements[category] ?? [];
  }

  AnitomyResult get toResult => const AnitomyResult();
}
