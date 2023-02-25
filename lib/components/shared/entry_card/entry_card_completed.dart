import 'package:flutter/material.dart';

import 'package:anikki/components/shared/frosted_circle.dart';

class EntryCardCompleted extends StatelessWidget {
  const EntryCardCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return FrostedCircle(
      child: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: const Center(
          child: Icon(
            Icons.done_all,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
