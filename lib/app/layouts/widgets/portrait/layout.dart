import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/shared/helpers/page.dart';
import 'package:anikki/app/layouts/widgets/portrait/anikki_navigation_bar.dart';
import 'package:anikki/core/helpers/connectivity_bloc/connectivity_bloc.dart';

class PortraitLayout extends StatefulWidget {
  const PortraitLayout({
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
  State<PortraitLayout> createState() => _PortraitLayoutState();
}

class _PortraitLayoutState extends State<PortraitLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final connected = BlocProvider.of<ConnectivityBloc>(context, listen: true)
        .state is ConnectivityOnline;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: widget.pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                children: widget.pages.map((page) => page.child).toList(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnikkiNavigationBar(
                  currentIndex: currentIndex,
                  pages: widget.pages,
                  onPageChanged: widget.onPageChanged,
                  connected: connected,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
