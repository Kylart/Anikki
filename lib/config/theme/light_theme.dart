part of 'theme.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff223a5e),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff97baea),
  onPrimaryContainer: Color(0xff0d1013),
  secondary: Color(0xff144955),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffa9edff),
  onSecondaryContainer: Color(0xff0e1414),
  tertiary: Color(0xff208399),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffccf3ff),
  onTertiaryContainer: Color(0xff111414),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  surface: Color(0xfff8f9fa),
  onSurface: Color(0xff090909),
  surfaceContainerHighest: Color(0xffe2e4e6),
  onSurfaceVariant: Color(0xff111112),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff111213),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffaabbd5),
  surfaceTint: Color(0xff223a5e),
);

final _baseLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
);

final lightTheme = _baseLightTheme.copyWith(
  textTheme: GoogleFonts.overpassMonoTextTheme(_baseLightTheme.textTheme),
);
