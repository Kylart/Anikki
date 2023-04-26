import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:protocol_handler/protocol_handler.dart';

import 'package:anikki/helpers/connectivity_bloc/connectivity_bloc.dart';
import 'package:anikki/features/anilist_auth/mixins/anilist_auth_mixin.dart';
import 'package:anikki/bloc_provider.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/bloc_observer.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/layouts/landscape/layout.dart';
import 'package:anikki/layouts/portrait/layout.dart';

void main() async {
  /// Flutter hooks
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  Paint.enableDithering = true;

  final storageDirectory =
      kDebugMode || Platform.environment.containsKey('FLUTTER_TEST')
          ? await getTemporaryDirectory()
          : await getApplicationDocumentsDirectory();

  await Future.wait([
    /// Storage
    Hive.initFlutter(storageDirectory.path),

    /// Desktop hooks
    if (isDesktop()) setUpDesktop(),

    /// Register a custom protocol
    protocolHandler.register('anikki'),

    /// Register env variables
    dotenv.load(),
  ]);

  /// Bloc init hooks
  Bloc.observer = const Observer();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: storageDirectory,
  );

  runApp(
    //// Providers are above [Anikki] instead of inside it, so that tests
    //// can use [Anikki] while mocking the providers
    const AnikkiBlocProvider(
      child: Anikki(),
    ),
  );
}

class Anikki extends StatefulWidget {
  const Anikki({
    super.key,
  });

  @override
  State<Anikki> createState() => _AnikkiState();
}

class _AnikkiState extends State<Anikki>
    with ProtocolListener, AnilistAuthMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anikki',

      /// This theme was made for FlexColorScheme version 6.1.1. Make sure
      /// you use same or higher version, but still same major version. If
      /// you use a lower version, some properties may not be supported. In
      /// that case you can also remove them after copying the theme to your app.
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepBlue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        tooltipsMatchBackground: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
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
        /// fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepBlue,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 15,
        swapColors: true,
        tooltipsMatchBackground: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
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

        /// To use the Playground font, add GoogleFonts package and uncomment
        /// fontFamily: GoogleFonts.notoSans().fontFamily,
      ),

      themeMode: BlocProvider.of<SettingsBloc>(context, listen: true)
          .state
          .settings
          .theme,
      home: Scaffold(
        body: SafeArea(
          /// This BlocBuilder is necessary to instanciate the [ConnectivityBloc]
          /// Otherwise it is instanciated on the first use.
          child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, _) {
              return LayoutBuilder(
                builder: ((BuildContext context, BoxConstraints constraints) {
                  return constraints.maxWidth > 800
                      ? const LandscapeLayout()
                      : const PortraitLayout();
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
