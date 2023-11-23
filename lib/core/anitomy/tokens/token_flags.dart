part of 'tokens.dart';

sealed class TokenFlags {
  static const none = 0;

  /// Categories
  static const bracket = 1 << 0;
  static const notBracket = 1 << 1;
  static const delimiter = 1 << 2;
  static const notDelimiter = 1 << 3;
  static const identifier = 1 << 4;
  static const notIdentifier = 1 << 5;
  static const unknwon = 1 << 6;
  static const notUnknown = 1 << 7;
  static const valid = 1 << 8;
  static const notValid = 1 << 9;

  /// Enclosed;
  static const enclosed = 1 << 10;
  static const notEnclosed = 1 << 11;

  /// Masks;
  static const maskCategories = TokenFlags.bracket |
      TokenFlags.notBracket |
      TokenFlags.delimiter |
      TokenFlags.notDelimiter |
      TokenFlags.identifier |
      TokenFlags.notIdentifier |
      TokenFlags.unknwon |
      TokenFlags.notUnknown |
      TokenFlags.valid |
      TokenFlags.notValid;

  static const maskEnclosed = TokenFlags.enclosed | TokenFlags.notEnclosed;
}
