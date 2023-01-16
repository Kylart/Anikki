import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kawanime/components/settings/settings.dart';
import 'package:kawanime/layouts/portrait/bottom_navigation_bar.dart';
import 'package:kawanime/providers/navigation.dart';
import 'package:kawanime/views/home.dart';

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
            Home(),
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
