import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/settings/settings.dart';
import 'package:anikki/layouts/portrait/bottom_navigation_bar.dart';
import 'package:anikki/providers/navigation.dart';

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          controller: context.watch<Navigation>().pageController,
          onPageChanged: (index) {
            context.read<Navigation>().index = index;
          },
          children: const [
            SizedBox(),
            SizedBox(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
