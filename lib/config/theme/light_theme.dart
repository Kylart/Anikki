part of 'theme.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.deepBlue,
  surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
  blendLevel: 15,
  swapColors: true,
  tooltipsMatchBackground: true,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
    sliderValueTinted: true,
    sliderTrackHeight: 1,
    inputDecoratorRadius: 40.0,
    fabUseShape: true,
    fabAlwaysCircular: true,
    chipSchemeColor: SchemeColor.primaryContainer,
    chipRadius: 40.0,
    cardRadius: 40.0,
    popupMenuRadius: 12.0,
    dialogRadius: 40.0,
    timePickerDialogRadius: 40.0,
    bottomSheetRadius: 40.0,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,

  /// To use the playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.overpass().fontFamily,
);
