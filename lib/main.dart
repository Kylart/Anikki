import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kawanime/layouts/landscape/layout.dart';
import 'package:kawanime/layouts/portrait/layout.dart';
import 'package:kawanime/providers/navigation.dart';
import 'package:kawanime/providers/user_preferences.dart';

import 'package:provider/provider.dart';

import 'package:kawanime/providers/anilist/anilist.dart';
import 'package:kawanime/providers/nyaa/nyaa.dart';

void main() {
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
      theme: _buildTheme(
        context.watch<UserPreferences>().darkTheme
            ? Brightness.dark
            : Brightness.light,
      ),
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


ThemeData _buildTheme(Brightness brightness) {
  final palette = {
    'primary': Color(0x00858C),
    'secondary': Color(0x42917C),
    'accent': Color(0xDDF6EE),
  };

  final baseTheme = ThemeData(
    brightness: brightness,
    useMaterial3: true,
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noThumb),
    dividerColor: brightness == Brightness.dark ? Colors.white24 : Colors.black26,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.josefinSansTextTheme(baseTheme.textTheme),
    // textTheme: GoogleFonts.patrickHandTextTheme(baseTheme.textTheme),
  );
}
