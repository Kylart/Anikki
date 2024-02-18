import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/layouts/widgets/landscape/navigation_rail_icon.dart';
import 'package:anikki/app/search/view/search_view.dart';
import 'package:anikki/core/helpers/notify.dart';

class AnikkiNavigationRail extends StatelessWidget {
  const AnikkiNavigationRail({
    super.key,
    required this.pages,
    required this.onPageChanged,
    required this.currentIndex,
    this.connected = false,
  });

  final List<AnikkiPage> pages;
  final void Function(int index) onPageChanged;
  final int currentIndex;
  final bool connected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
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
          if (!connected)
            AnikkiNavigationRailIcon(
              icon: Ionicons.cloud_offline_outline,
              selectedIcon: Ionicons.cloud_offline_outline,
              selected: false,
              onPressed: () => context.notify(
                message: 'Cannot connect to the Internet',
                descritpion:
                    'Anikki will reconnect automatically whenever possible.',
                isError: true,
              ),
              error: 'Cannot connect to the Internet',
            ),
          const Spacer(),
          for (final (index, page) in pages.indexed)
            AnikkiNavigationRailIcon(
              icon: page.icon,
              selectedIcon: page.selectedIcon,
              selected: index == currentIndex,
              title: page.name,
              error: page.error,
              onPressed: () => onPageChanged(index),
            ),
        ],
      ),
    );
  }
}
