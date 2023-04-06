import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomGridView<T> extends StatelessWidget {
  final List<T> entries;

  const CustomGridView({
    super.key,
    required this.entries,
    required this.builder,
    this.gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 0.6,
    ),
  });

  final SliverGridDelegate gridDelegate;
  final Widget Function(T entry, int index) builder;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: entries.length,
        gridDelegate: gridDelegate,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 300),
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: builder(entries[index], index),
              ),
            ),
          );
        },
      ),
    );
  }
}
