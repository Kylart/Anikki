import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kawanime/components/settings/settings.dart';
import 'package:kawanime/layouts/landscape/navigation_rail.dart';
import 'package:kawanime/providers/navigation.dart';
import 'package:kawanime/views/home.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            const CustomNavigationRail(),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: PageView(
                allowImplicitScrolling: true,
                scrollDirection: Axis.vertical,
                controller: context.watch<Navigation>().pageController,
                onPageChanged: (index) {
                  context.read<Navigation>().index = index;
                },
                children: const [
                  Home(),
                  SizedBox(),
                  SizedBox(),
                  SettingsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
