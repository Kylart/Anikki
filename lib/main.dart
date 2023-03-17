import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:provider/provider.dart';

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

  // Register a custom protocol
  await protocolHandler.register('anikki');

  // Register env variables
  await dotenv.load();

  final anilistStore = await AnilistStore.create();

  runApp(
    /// Providers are above [Anikki] instead of inside it, so that tests
    /// can use [Anikki] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalStore()),
        ChangeNotifierProvider(create: (_) => anilistStore),

        /// User Preferences
        ChangeNotifierProvider(create: (_) => AnilistToken()),
        ChangeNotifierProvider(create: (_) => LocalDirectory()),
        ChangeNotifierProvider(create: (_) => DarkTheme()),
        ChangeNotifierProvider(create: (_) => NewsLayout()),
        ChangeNotifierProvider(create: (_) => UserListLayout()),
      ],
      child: const Anikki(),
    ),
  );
}

class Anikki extends StatefulWidget {
  const Anikki({super.key});

  @override
  State<Anikki> createState() => _AnikkiState();
}

class _AnikkiState extends State<Anikki> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<DarkTheme>().active;
    return MaterialApp(
      title: 'Anikki',
      theme: ThemeData(
        dividerTheme: const DividerThemeData(
          color: Colors.black54,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          brightness: Brightness.light,
          cardColor: Colors.white.withOpacity(0.3),
          backgroundColor: Colors.white.withOpacity(0.55),
        ),
        useMaterial3: true
      ),
      darkTheme: ThemeData(
        dividerTheme: const DividerThemeData(
          color: Colors.white54,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          brightness: Brightness.dark,
          cardColor: Colors.black.withOpacity(0.5),
          backgroundColor: Colors.black.withOpacity(0.95),
        ),
        useMaterial3: true,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: isDark
                ? const AssetImage(
                    'assets/images/glassmorphism_background_dark.jpeg',
                  )
                : const AssetImage(
                    'assets/images/glassmorphism_background_light.jpeg',
                  ),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: TitlebarSafeArea(
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
