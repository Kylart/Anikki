import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/layouts/widgets/landscape/navigation_rail_icon.dart';
import 'package:anikki/app/search/view/search_view.dart';

class AnikkiNavigationRail extends StatelessWidget {
  const AnikkiNavigationRail({
    super.key,
    required this.pages,
    required this.onPageChanged,
    required this.currentIndex,
  });

  final List<AnikkiPage> pages;
  final void Function(int index) onPageChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          AnikkiNavigationRailIcon(
            icon: Ionicons.search_outline,
            selectedIcon: Ionicons.search_outline,
            selected: false,
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return const Dialog(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  alignment: Alignment.topCenter,
                  child: SearchView(),
                );
              },
            ),
          ),
          const Spacer(),
          for (final (index, page) in pages.indexed)
            AnikkiNavigationRailIcon(
              icon: page.icon,
              selectedIcon: page.selectedIcon,
              selected: index == currentIndex,
              title: page.name,
              onPressed: () => onPageChanged(index),
            ),
        ],
      ),
    );
  }
}
