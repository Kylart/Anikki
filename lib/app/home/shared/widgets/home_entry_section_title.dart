import 'dart:ui';

import 'package:flutter/material.dart';

class HomeEntrySectionTitle extends StatelessWidget {
  const HomeEntrySectionTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
