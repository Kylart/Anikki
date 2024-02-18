import 'dart:io';

import 'package:anikki/app/search/view/search_view.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/layouts/shared/helpers/page.dart';
import 'package:anikki/core/widgets/macos_title_bar.dart';
import 'package:ionicons/ionicons.dart';

class AnikkiNavigationRailIcon extends StatelessWidget {
  const AnikkiNavigationRailIcon({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onPressed,
    this.title,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String? title;
  final void Function() onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              selected ? selectedIcon : icon,
              size: 24,
              color: selected ? Theme.of(context).colorScheme.primary : null,
            ),
            const SizedBox(
              height: 5,
            ),
            if (title != null)
              Text(
                title!,
                style: TextStyle(
                  color:
                      selected ? Theme.of(context).colorScheme.primary : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LandscapeLayout extends StatefulWidget {
  const LandscapeLayout({
    super.key,
    required this.pageController,
    required this.pages,
    required this.onPageChanged,
    required this.connected,
  });

  final PageController pageController;
  final List<AnikkiPage> pages;
  final void Function(int index) onPageChanged;
  final bool connected;

  @override
  State<LandscapeLayout> createState() => _LandscapeLayoutState();
}

class _LandscapeLayoutState extends State<LandscapeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: [
                  Padding(
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
                        for (final (index, page) in widget.pages.indexed)
                          AnikkiNavigationRailIcon(
                            icon: page.icon,
                            selectedIcon: page.selectedIcon,
                            selected: index == currentIndex,
                            title: page.name,
                            onPressed: () => widget.onPageChanged(index),
                          ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Expanded(
                    child: PageView(
                      controller: widget.pageController,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      children: widget.pages.map((page) => page.child).toList(),
                    ),
                  )
                ],
              ),
            ),
            if (Platform.isMacOS) const MacosTitleBar(),
          ],
        ),
      ),
    );
  }
}
