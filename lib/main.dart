import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:kawanime/providers/anilist.dart';
import 'package:kawanime/providers/nyaa.dart';

import 'package:kawanime/views/home.dart';

void main() {
  runApp(
    /// Providers are above [KawAnime] instead of inside it, so that tests
    /// can use [KawAnime] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnilistStore()),
        ChangeNotifierProvider(create: (_) => NyaaStore()),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: const Home(),
        bottomNavigationBar: BottomNavigationBar(
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Local',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: 'Player',
            ),
          ],
        ),
      ),
    );
  }
}
