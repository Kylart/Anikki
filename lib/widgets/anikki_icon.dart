import 'package:flutter/material.dart';

class AnikkiIcon extends StatelessWidget {
  const AnikkiIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 18,
    );
  }
}
