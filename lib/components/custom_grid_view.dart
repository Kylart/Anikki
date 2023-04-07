import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
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
    return ReorderableBuilder(
      enableDraggable: false,
      enableScrollingWhileDragging: false,
      onReorder: (_) {},
      builder: (children) {
        return AnimationLimiter(
          child: GridView(
            gridDelegate: gridDelegate,
            children: children,
          ),
        );
      },
      children: entries.mapIndexed((index, entry) {
        return AnimationConfiguration.staggeredList(
          key: Key(index.toString()),
          position: index,
          duration: const Duration(milliseconds: 300),
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: builder(entry, index),
            ),
          ),
        );
      }).toList(),
    );
  }
}
