import 'package:anikki/widgets/anikki_icon.dart';
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
            icon: AnikkiIcon(icon: Icons.new_releases_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Icons.folder_outlined),
            label: 'Local',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Icons.library_books_outlined),
            label: 'Watch List',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: AnikkiIcon(icon: Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
