import 'package:flutter/material.dart';

import 'package:anikki/app/home/shared/widgets/custom_menu.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomMenu(
          pageController: pageController,
          index: index,
        ),
      ],
    );
  }
}
