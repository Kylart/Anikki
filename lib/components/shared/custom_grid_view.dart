import 'package:flutter/material.dart';
import 'package:kawanime/components/news/news_grid_card.dart';
import 'package:kawanime/components/user_list/user_list_library_grid_card.dart';

enum GridViewType { local, watchList, news }

class CustomGridView extends StatefulWidget {
  final List<dynamic> entries;
  final GridViewType type;

  const CustomGridView({super.key, required this.entries, required this.type});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: widget.entries.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final entry = widget.entries[index];

          if (widget.type == GridViewType.news) return NewsGridCard(entry: entry);
          if (widget.type == GridViewType.local) return UserListLibraryGridCard(entry: entry);

          return const SizedBox();
        });
  }
}
