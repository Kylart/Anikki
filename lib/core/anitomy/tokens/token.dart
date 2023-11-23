part of 'tokens.dart';

class Token extends Equatable {
  const Token({
    required this.category,
    required this.content,
    required this.enclosed,
  });

  final TokenCategory category;
  final String content;
  final bool enclosed;

  bool _checkFlag(int flags, int flag) => (flags & flag) == flag;

  bool _checkCategory({
    required int fe,
    required int fn,
    required TokenCategory cat,
    required int flags,
  }) {
    return _checkFlag(flags, fe)
        ? category == cat
        : _checkFlag(flags, fn)
            ? category != cat
            : false;
  }

  bool checkFlags(int flags) {
    if (flags & TokenFlags.maskEnclosed != 0) {
      final success =
          _checkFlag(flags, TokenFlags.enclosed) ? enclosed : !enclosed;

      if (!success) return false;
    }

    if (flags & TokenFlags.maskCategories != 0) {
      if (_checkCategory(
        fe: TokenFlags.bracket,
        fn: TokenFlags.notBracket,
        cat: TokenCategory.bracket,
        flags: flags,
      )) return true;

      if (_checkCategory(
        fe: TokenFlags.delimiter,
        fn: TokenFlags.notDelimiter,
        cat: TokenCategory.delimiter,
        flags: flags,
      )) return true;

      if (_checkCategory(
        fe: TokenFlags.identifier,
        fn: TokenFlags.notIdentifier,
        cat: TokenCategory.identifier,
        flags: flags,
      )) return true;

      if (_checkCategory(
        fe: TokenFlags.unknwon,
        fn: TokenFlags.notUnknown,
        cat: TokenCategory.unknown,
        flags: flags,
      )) return true;

      if (_checkCategory(
        fe: TokenFlags.valid,
        fn: TokenFlags.notValid,
        cat: TokenCategory.invavlid,
        flags: flags,
      )) return true;

      return false;
    }

    return true;
  }

  @override
  List<Object> get props => [
        category,
        content,
        enclosed,
      ];

  @override
  bool get stringify => true;
}
