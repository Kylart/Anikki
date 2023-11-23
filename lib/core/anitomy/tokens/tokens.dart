import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

part 'token.dart';
part 'token_category.dart';
part 'token_flags.dart';

class Tokens {
  const Tokens([
    this.tokens = const [],
  ]);

  final List<Token> tokens;

  List<Token> getList({
    int? flags,
    Token? begin,
    Token? end,
  }) {
    final beginIndex = begin == null ? 0 : tokens.indexOf(begin);
    final endIndex = end == null ? tokens.length : tokens.indexOf(end);

    if (flags == null) {
      return tokens.sublist(beginIndex, endIndex + 1);
    }

    return tokens
        .sublist(beginIndex, endIndex + 1)
        .where((token) => token.checkFlags(flags))
        .toList();
  }

  int distance({
    Token? begin,
    Token? end,
  }) {
    final beginIndex = begin == null ? 0 : tokens.indexOf(begin);
    final endIndex = end == null ? tokens.length : tokens.indexOf(end);

    return endIndex - beginIndex;
  }

  Token? _findInTokens(int flags, List<Token> tokens) {
    return tokens.firstWhereOrNull((token) => token.checkFlags(flags));
  }

  Token? find(int flags) {
    return _findInTokens(flags, tokens);
  }

  Token? findPrevious({
    Token? token,
    required int flags,
  }) {
    var tokens = List<Token>.from(this.tokens);

    if (token == null) {
      tokens = tokens.reversed.toList();
    } else {
      final tokenIndex = tokens.indexOf(token);
      tokens = tokens.sublist(tokenIndex - 1).reversed.toList();
    }

    return _findInTokens(flags, tokens);
  }

  Token? findNext({
    Token? token,
    required int flags,
  }) {
    var tokens = List<Token>.from(this.tokens);

    if (token != null) {
      final tokenIndex = tokens.indexOf(token);
      tokens = tokens.sublist(tokenIndex + 1);
    }

    return _findInTokens(flags, tokens);
  }
}
