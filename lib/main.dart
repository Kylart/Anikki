import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kawanime/helpers/desktop_hooks.dart';
import 'package:kawanime/layouts/landscape/layout.dart';
import 'package:kawanime/layouts/portrait/layout.dart';
import 'package:kawanime/providers/navigation.dart';
import 'package:kawanime/providers/user_preferences.dart';
import 'package:kawanime/providers/anilist/anilist.dart';
import 'package:kawanime/providers/nyaa/nyaa.dart';

void main() {
  if (isDesktop()) setUpDesktop();

  runApp(
    /// Providers are above [KawAnime] instead of inside it, so that tests
    /// can use [KawAnime] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnilistStore()),
        ChangeNotifierProvider(create: (_) => NyaaStore()),
        ChangeNotifierProvider(create: (_) => Navigation()),
        ChangeNotifierProvider(create: (_) => UserPreferences()),
      ],
      child: const KawAnime(),
    ),
  );
}

class KawAnime extends StatelessWidget {
  const KawAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KawAnime',
      theme: FlexThemeData.light(
        scheme: FlexScheme.aquaBlue,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.aquaBlue,
        darkIsTrueBlack: true,
        useMaterial3: true, 
      ),
      themeMode: context.watch<UserPreferences>().darkTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const KawAnimePage(),
    );
  }
}

class KawAnimePage extends StatelessWidget {
  const KawAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        return constraints.maxWidth > 600
            ? const LandscapeLayout()
            : const PortraitLayout();
      }),
    );
  }
}

// ThemeData _buildTheme(Brightness brightness) {
//   final baseTheme = ThemeData(
//     brightness: brightness,
//     useMaterial3: true,
//     primarySwatch: Colors.teal,
//   );

//   return baseTheme.copyWith(
//     textTheme: GoogleFonts.josefinSansTextTheme(baseTheme.textTheme),
//     // textTheme: GoogleFonts.patrickHandTextTheme(baseTheme.textTheme),
//   );
// }
