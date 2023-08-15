import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

class HomeScrollView extends StatelessWidget {
  const HomeScrollView({
    super.key,
    required this.children,
    this.reverse = false,
  });

  final List<Widget> children;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Marqueer(
        pps: 25,
        direction: reverse ? MarqueerDirection.ltr : MarqueerDirection.rtl,
        restartAfterInteraction: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: children,
          ),
        ),
      ),
    );
  }
}
