import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:provider/provider.dart';

import 'package:anikki/bloc_observer.dart';
import 'package:anikki/providers/anilist/client.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/layouts/landscape/layout.dart';
import 'package:anikki/layouts/portrait/layout.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/user_preferences/user_preferences.dart';
import 'package:anikki/components/anilist_auth/anilist_token.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop()) setUpDesktop();

  /// Register a custom protocol
  await protocolHandler.register('anikki');

  /// Register env variables
  await dotenv.load();

  Paint.enableDithering = true;

  Bloc.observer = const Observer();

  await initHiveForFlutter();
  final anilistClient = getAnilistClient();

  runApp(
    //// Providers are above [Anikki] instead of inside it, so that tests
    //// can use [Anikki] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalStore()),
        ChangeNotifierProvider(
          create: (_) => AnilistStore(
            client: anilistClient,
          ),
        ),

        //// User Preferences
        ChangeNotifierProvider(create: (_) => AnilistToken()),
        ChangeNotifierProvider(create: (_) => LocalDirectory()),
        ChangeNotifierProvider(create: (_) => AnikkiTheme()),
        ChangeNotifierProvider(create: (_) => NewsLayout()),
        ChangeNotifierProvider(create: (_) => UserListLayout()),
      ],
      child: Anikki(
        client: anilistClient,
      ),
    ),
  );
}

class Anikki extends StatefulWidget {
  const Anikki({
    super.key,
    required this.client,
  });

  final GraphQLClient client;

  @override
  State<Anikki> createState() => _AnikkiState();
}

class _AnikkiState extends State<Anikki> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(widget.client),
      child: MaterialApp(
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

        themeMode: context.watch<AnikkiTheme>().theme,
        home: Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: ((BuildContext context, BoxConstraints constraints) {
                return constraints.maxWidth > 600
                    ? const LandscapeLayout()
                    : const PortraitLayout();
              }),
            ),
          ),
        ),
      ),
    );
  }
}
