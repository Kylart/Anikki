import 'package:flutter/material.dart';

class AnikkiGlassIcon extends StatelessWidget {
  const AnikkiGlassIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
