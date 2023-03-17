import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCircle extends StatelessWidget {
  const GlassCircle({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: child,
        ),
      ),
    );
  }
}
