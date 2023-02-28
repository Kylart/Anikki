import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/providers/user_preferences/news_layout.dart';

class NewsAppBar extends StatefulWidget {
  const NewsAppBar({
    super.key,
    required this.onDateChange,
    required this.initialRange,
  });

  final void Function(DateTimeRange layout) onDateChange;
  final DateTimeRange initialRange;

  @override
  State<NewsAppBar> createState() => _NewsAppBarState();
}

class _NewsAppBarState extends State<NewsAppBar> {
  final List<bool> isSelected = <bool>[false, true];
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      title: const Text('News'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final dateRange = await showDateRangePicker(
                context: context,
                initialDateRange: widget.initialRange,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 7)),
              );

              if (dateRange == null) return;

              widget.onDateChange(dateRange);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleButtons(
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
              });

              context.read<NewsLayout>().layout =
                  isSelected[0] == true ? NewsLayouts.list : NewsLayouts.grid;
            },
            children: const [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          ),
        ),
      ],
    );
  }
}
