import 'package:flutter/material.dart';

class NewsAppBar extends StatefulWidget {
  const NewsAppBar({super.key, required this.onLayoutChange});

  final void Function(String layout) onLayoutChange;

  @override
  State<NewsAppBar> createState() => _NewsAppBarState();
}

class _NewsAppBarState extends State<NewsAppBar> {
  final List<bool> isSelected = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).backgroundColor,
      title: const Text('News'),
      actions: [
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

              widget.onLayoutChange(isSelected[0] == true ? 'list' : 'grid');
            },
            children: const [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        )
      ],
    );
  }
}
