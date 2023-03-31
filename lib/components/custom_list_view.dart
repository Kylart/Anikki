import 'package:flutter/material.dart';

import 'package:anikki/components/list_view_divider.dart';

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
    return ListView.separated(
      padding: const EdgeInsets.all(4.0),
      itemCount: entries.length,
      separatorBuilder: (context, index) => const ListViewDivider(),
      itemBuilder: (context, index) {
        return builder(context, entries[index]);
      },
    );
  }
}
