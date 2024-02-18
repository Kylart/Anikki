import 'dart:io';
import 'dart:math';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/media_dialog/widgets/media_dialog_media.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/layouts/shared/helpers/page.dart';
import 'package:anikki/app/layouts/widgets/landscape/navigation_rail.dart';
import 'package:anikki/core/widgets/macos_title_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        width: state.drawerMedia != null
                            ? min(500, MediaQuery.of(context).size.width / 3.5)
                            : 0,
                        child: Material(
                          elevation: 20,
                          child: state.drawerMedia != null
                              ? MediaDialogMedia(
                                  media: state.drawerMedia!,
                                  libraryEntry: state.drawerLibraryEntry,
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
