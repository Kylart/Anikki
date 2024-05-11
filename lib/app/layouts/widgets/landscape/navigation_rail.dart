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

  final iconSize = 20.0;
  final verticalPadding = 18.0;
  final horizontalPadding = 14.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, -0.92),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: (iconSize + verticalPadding) * (pages.length + 1) +
                  verticalPadding,
              width: iconSize + (horizontalPadding * 2),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalPadding,
                      ),
                      child: AnikkiNavigationRailIcon(
                        iconSize: iconSize,
                        icon: Ionicons.search_outline,
                        selectedIcon: Ionicons.search_outline,
                        selected: false,
                        title: 'Search',
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
                    ),
                    for (final (index, page) in pages.indexed)
                      Padding(
                        padding: EdgeInsets.only(bottom: verticalPadding),
                        child: AnikkiNavigationRailIcon(
                          icon: page.icon,
                          selectedIcon: page.selectedIcon,
                          iconSize: iconSize,
                          selected: index == currentIndex,
                          title: page.name,
                          error: page.error,
                          onPressed: () => onPageChanged(index),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (!connected)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                ),
                child: Opacity(
                  opacity: 0.7,
                  child: AnikkiNavigationRailIcon(
                    iconSize: iconSize,
                    icon: Ionicons.cloud_offline_outline,
                    selectedIcon: Ionicons.cloud_offline_outline,
                    selected: false,
                    title: 'Cannot connect to the Internet',
                    onPressed: () => context.notify(
                      message: 'Cannot connect to the Internet',
                      descritpion:
                          'Anikki will reconnect automatically whenever possible.',
                      isError: true,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
