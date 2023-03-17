import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class LayoutCard extends StatelessWidget {
  const LayoutCard({super.key, required this.child});

  final Widget child;

  final borderRadius = const BorderRadius.all(Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.shade800.withOpacity(0.3),
                    Colors.white.withOpacity(0.4),
                  ],
                ),
                width: 1,
              ),
              gradient: LinearGradient(
                begin: const Alignment(0.2, 0),
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade800.withOpacity(0.07),
                  Colors.white.withOpacity(0.12),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
