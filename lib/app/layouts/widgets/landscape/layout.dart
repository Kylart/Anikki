import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/page.dart';
import 'package:anikki/app/layouts/widgets/landscape/navigation_rail.dart';
import 'package:anikki/core/widgets/macos_title_bar.dart';
import 'package:anikki/core/widgets/media_details/widgets/media_details.dart';

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
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Row(
                    children: [
                      AnikkiNavigationRail(
                        pages: widget.pages,
                        currentIndex: currentIndex,
                        onPageChanged: widget.onPageChanged,
                        connected: widget.connected,
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
                          children:
                              widget.pages.map((page) => page.child).toList(),
                        ),
                      ),
                      if (state.drawerMedia != null)
                        const VerticalDivider(
                          width: 1,
                        ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        height: double.infinity,
                        width: state.drawerMedia != null ? 500 : 0,
                        child: Material(
                          color: Colors.transparent,
                          elevation: 20,
                          child: state.drawerMedia != null
                              ? AnimatedSwitcher(
                                  layoutBuilder:
                                      (currentChild, previousChildren) {
                                    return Stack(
                                      fit: StackFit.passthrough,
                                      alignment: Alignment.topCenter,
                                      children: <Widget>[
                                        Row(
                                          children: previousChildren
                                              .map(
                                                (e) => Expanded(child: e),
                                              )
                                              .toList(),
                                        ),
                                        if (currentChild != null)
                                          Column(
                                            children: [
                                              Expanded(child: currentChild),
                                            ],
                                          ),
                                      ],
                                    );
                                  },
                                  transitionBuilder: (
                                    Widget child,
                                    Animation<double> animation,
                                  ) {
                                    return SlideTransition(
                                      position: Tween(
                                        begin: const Offset(1.0, 0.0),
                                        end: const Offset(0.0, 0.0),
                                      ).animate(animation),
                                      child: child,
                                    );
                                  },
                                  duration: const Duration(milliseconds: 300),
                                  switchInCurve: Curves.easeIn,
                                  switchOutCurve: Curves.fastOutSlowIn,
                                  child: MediaDetails(
                                    key: ValueKey(
                                      state.drawerMedia!.anilistInfo.id,
                                    ),
                                    media: state.drawerMedia!,
                                    libraryEntry: state.drawerLibraryEntry,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Platform.isMacOS) const MacosTitleBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
