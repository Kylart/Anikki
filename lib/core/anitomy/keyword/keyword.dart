import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../elements.dart';
import '../element_category.dart';

part 'keyword_manager.dart';
part 'keyword_options.dart';

class Keyword extends Equatable {
  const Keyword({
    required this.category,
    required this.options,
  });

  final ElementCategory category;
  final KeywordOptions options;

  @override
  List<Object> get props => [
        category,
        options,
      ];
}

final keywordManager = KeywordManager();
