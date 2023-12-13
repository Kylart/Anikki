import 'package:anikki/app/home_start/shared/helpers/should_be_marquee.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marqueer/marqueer.dart';

class HomeScrollView extends StatefulWidget {
  const HomeScrollView({
    super.key,
    required this.children,
    this.reverse = false,
  });

  final List<Widget> children;
  final bool reverse;

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
    return BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, layoutState) {
      final marquee = shouldBeMarquee(layoutState, widget.children.length);
      final height = MediaQuery.of(context).size.height < 1000 ? 250.0 : 300.0;

      final listView = SingleChildScrollView(
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
              right: 0,
              height: height,
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
              height: height,
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
