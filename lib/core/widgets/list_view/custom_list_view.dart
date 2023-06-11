import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:anikki/core/widgets/list_view/list_view_divider.dart';

class CustomListView<T> extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.entries,
    required this.builder,
  });

  final List<T> entries;
  final Widget Function(BuildContext context, T entry) builder;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        padding: const EdgeInsets.all(4.0),
        itemCount: entries.length,
        separatorBuilder: (context, index) => const ListViewDivider(),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 300),
            child: SlideAnimation(
              child: FadeInAnimation(
                child: builder(context, entries[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
