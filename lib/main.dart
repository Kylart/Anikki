import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:provider/provider.dart';

import 'package:anikki/providers/local/local.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/layouts/landscape/layout.dart';
import 'package:anikki/layouts/portrait/layout.dart';
import 'package:anikki/providers/navigation.dart';
import 'package:anikki/providers/user_preferences.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/nyaa/nyaa.dart';

void main() async {
  if (isDesktop()) setUpDesktop();

  // Register a custom protocol
  await protocolHandler.register('anikki');

  runApp(
    /// Providers are above [Anikki] instead of inside it, so that tests
    /// can use [Anikki] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalStore()),
        ChangeNotifierProvider(create: (_) => AnilistStore()),
        ChangeNotifierProvider(create: (_) => NyaaStore()),
        ChangeNotifierProvider(create: (_) => Navigation()),
        ChangeNotifierProvider(create: (_) => UserPreferences()),
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

class _AnikkiState extends State<Anikki> with ProtocolListener {
  String protocolUrl = 'Anikki';

  @override
  void initState() {
    protocolHandler.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    protocolHandler.removeListener(this);
    super.dispose();
  }

  @override
  void onProtocolUrlReceived(String url) {
    String log = 'Url received: $url)';
    setState(() {
      protocolUrl = log;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anikki',
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
      home: LayoutBuilder(
        builder: ((BuildContext context, BoxConstraints constraints) {
          return constraints.maxWidth > 600
              ? const LandscapeLayout()
              : const PortraitLayout();
        }),
      ),
    );
  }
}
