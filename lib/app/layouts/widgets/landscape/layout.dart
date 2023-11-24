import 'dart:io';

import 'package:flutter/material.dart';

import 'package:anikki/app/home/view/home_view.dart';
import 'package:anikki/core/widgets/macos_title_bar.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeView(),
        if (Platform.isMacOS) const MacosTitleBar(),
      ],
    );
  }
}
