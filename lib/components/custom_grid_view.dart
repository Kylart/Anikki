import 'package:flutter/material.dart';

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
  final Widget Function(T entry) builder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: entries.length,
      gridDelegate: gridDelegate,
      itemBuilder: (context, index) {
        return builder(entries[index]);
      },
    );
  }
}
