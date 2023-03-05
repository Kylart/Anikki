import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedCircle extends StatelessWidget {
  const FrostedCircle({super.key, required this.child});

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
