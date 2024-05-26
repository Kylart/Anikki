import 'dart:ui';

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    this.actions = const [],
    this.frosted = false,
  });

  final String text;
  final List<Widget> actions;
  final bool frosted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: BackdropFilter(
          filter: frosted
              ? ImageFilter.blur(sigmaX: 40, sigmaY: 40)
              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                if (actions.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 36,
                      width: 1,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                if (actions.isNotEmpty) ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
