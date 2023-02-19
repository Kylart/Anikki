import 'package:flutter/material.dart';

import 'package:kawanime/providers/navigation.dart';
import 'package:provider/provider.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
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
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: context.watch<Navigation>().index,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Theme.of(context).colorScheme.background,
      onTap: (index) {
        context.read<Navigation>().changeToPage(index);
      },
    );
  }
}
