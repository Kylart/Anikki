import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/layouts/widgets/portrait/not_connected_icon.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class AnikkiNavigationBar extends StatelessWidget {
  const AnikkiNavigationBar({
    super.key,
    required this.currentIndex,
    required this.pages,
    required this.onPageChanged,
    this.connected = false,
  });

  final int currentIndex;
  final List<AnikkiPage> pages;
  final void Function(int index) onPageChanged;
  final bool connected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EntryTag(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
            child: Wrap(
              spacing: 12.0,
              children: [
                for (final (index, page) in pages.indexed)
                  Badge(
                    isLabelVisible: page.error != null,
                    label: const Icon(
                      HugeIcons.strokeRoundedAlert02,
                      size: 8,
                    ),
                    child: IconButton(
                      tooltip: page.error ?? page.name,
                      icon: Icon(page.icon),
                      onPressed: () => onPageChanged(index),
                      color: page == pages.elementAt(currentIndex)
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                if (!connected) const NotConnectedIcon()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
