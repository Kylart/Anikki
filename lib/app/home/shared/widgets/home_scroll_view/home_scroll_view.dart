import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marqueer/marqueer.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/app/home/shared/helpers/scroll_view_height.dart';
import 'package:anikki/app/home/shared/helpers/should_be_marquee.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

part 'home_scroll_view_loader.dart';

class HomeScrollView extends StatefulWidget {
  const HomeScrollView({
    super.key,
    required this.children,
    this.reverse = false,
    this.loading = false,
  });

  /// Widgets to display
  final List<Widget> children;

  /// If need be, marquee will be reversed
  final bool reverse;

  /// Will display [HomeScrollViewLoader] if set to `true`
  final bool loading;

  @override
  State<HomeScrollView> createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView> {
  bool show = false;

  final buttonWidth = 50.0;
  final duration = const Duration(milliseconds: 150);

  final controller = MarqueerController();

  @override
  Widget build(BuildContext context) {
    if (widget.loading) return const _HomeScrollViewLoader();

    return BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, layoutState) {
      final marquee = shouldBeMarquee(layoutState, widget.children.length);
      final height = getScrollViewHeight(context);

      final listView = SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: kHomeScrollViewPaddingValue / 2 - 2,
        ),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.children,
        ),
      );

      if (!marquee) {
        return SizedBox(
          height: height,
          child: listView,
        );
      }

      return MouseRegion(
        onEnter: (event) => setState(() {
          show = true;
        }),
        onHover: (event) => setState(() {
          show = true;
        }),
        onExit: (event) => setState(() {
          show = false;
        }),
        child: Stack(
          children: [
            SizedBox(
              height: height,
              child: Marqueer(
                controller: controller,
                pps: 25,
                direction: widget.reverse
                    ? MarqueerDirection.ltr
                    : MarqueerDirection.rtl,
                restartAfterInteraction: true,
                child: listView,
              ),
            ),
            Positioned(
              top: kHomeScrollViewPaddingValue + 2,
              right: 0,
              height: height - (kHomeScrollViewPaddingValue + 2) * 2,
              width: buttonWidth,
              child: AnimatedOpacity(
                opacity: show ? 1 : 0,
                duration: duration,
                child: Material(
                  color: Colors.black54,
                  child: InkWell(
                    onTap: () => controller
                        .animateTo(MediaQuery.of(context).size.width / 2),
                    child: const Icon(
                      Ionicons.chevron_forward_outline,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: kHomeScrollViewPaddingValue + 2,
              height: height - (kHomeScrollViewPaddingValue + 2) * 2,
              width: buttonWidth,
              child: AnimatedOpacity(
                opacity: show ? 1 : 0,
                duration: duration,
                child: Material(
                  color: Colors.black54,
                  child: InkWell(
                    onTap: () => controller
                        .animateTo(-MediaQuery.of(context).size.width / 2),
                    child: const Icon(
                      Ionicons.chevron_back_outline,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
