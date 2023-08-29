import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/core/widgets/anikki_icon.dart';

class AnikkiNavigationBar extends StatelessWidget {
  const AnikkiNavigationBar({
    super.key,
    required this.index,
    required this.pageController,
  });

  final int index;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        /// Background color of Navbar
        canvasColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Theme.of(context).indicatorColor,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (value) {
          pageController.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Ionicons.newspaper_outline),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Ionicons.folder_outline),
            label: 'Local',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Ionicons.library_outline),
            label: 'Watch List',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Ionicons.search_outline),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Ionicons.settings_outline),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
