import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:flutter/material.dart';

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
            icon: AnikkiGlassIcon(icon: Icons.new_releases_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: AnikkiGlassIcon(icon: Icons.folder_outlined),
            label: 'Local',
          ),
          BottomNavigationBarItem(
            icon: AnikkiGlassIcon(icon: Icons.library_books_outlined),
            label: 'Watch List',
          ),
          BottomNavigationBarItem(
            icon: AnikkiGlassIcon(icon: Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: AnikkiGlassIcon(icon: Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
