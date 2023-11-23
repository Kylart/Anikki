import 'package:collection/collection.dart';

import 'anitomy_options.dart';
import 'elements.dart';
import 'tokens/tokens.dart';

class Tokenizer {
  Tokenizer({
    required this.filename,
    required this.elements,
    required this.tokens,
    required this.options,
  });

  final String filename;
  final Elements elements;
  final Tokens tokens;
  final AnitomyOptions options;

  bool tokenize() {
    _tokenizeByBrackets();
    return tokens.tokens.isNotEmpty;
  }

  void _addToken(TokenCategory category, String content, bool enclosed) {
    tokens.tokens.add(
      Token(
        category: category,
        content: content,
        enclosed: enclosed,
      ),
    );
  }

  void _tokenizeByBrackets() {
    final brackets = [
      ('(', ')'), // U+0028-U+0029 Parenthesis
      ('[', ']'), // U+005B-U+005D Square bracket
      ('{', '}'), // U+007B-U+007D Curly bracket
      ('\u300C', '\u300D'), // Corner bracket
      ('\u300E', '\u300F'), // White corner bracket
      ('\u3010', '\u3011'), // Black lenticular bracket
      ('\uFF08', '\uFF09'), // Fullwidth parenthesis
    ];

    var text = filename;
    var isBracketOpen = false;
    String? matchingBracket = '';
    int bracketIndex = -1;

    while (text.isNotEmpty) {
      if (!isBracketOpen) {
        final openBrackets = brackets.map((e) => e.$1);
        bracketIndex = text
            .split('')
            .indexWhere((bracket) => openBrackets.contains(bracket));
        matchingBracket = brackets
            .firstWhereOrNull(
              (bracketPair) => bracketPair.$1 == text[bracketIndex],
            )
            ?.$2;
      } else if (matchingBracket != null) {
        bracketIndex =
            text.split('').indexWhere((element) => element == matchingBracket);
      }

      /// Found a token before the bracket
      if (bracketIndex != 0) {}

      /// Found bracket
      if (bracketIndex != -1) {
        _addToken(TokenCategory.bracket, text.substring(bracketIndex, 1), true);
        isBracketOpen = !isBracketOpen;
        text = text.substring(bracketIndex + 1);
      } else {
        /// Reached the end
        text = '';
      }

      // if bracket_index != 0:  # Found a token before the bracket
      //     self._tokenize_by_preidentified(
      //         text[:bracket_index] if bracket_index != -1 else text,
      //         enclosed=is_bracket_open
      //     )
    }

    // void _tokenizeByPreidentified(String text, bool enclosed) {
    //   final preidentifiedTokens = keywordManager.peek(elements, text);
    // }

    // void _tokenizeByDelimiters(String text, bool enclosed) {}

    // void _validateDelimiterTokens() {

    // }
  }
}
