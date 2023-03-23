import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/providers/user_preferences/user_preferences.dart';

class NewsLayoutToggle extends StatelessWidget {
  const NewsLayoutToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleButtons(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        isSelected: context.watch<NewsLayout>().layout == NewsLayouts.grid
            ? [false, true]
            : [true, false],
        onPressed: (int index) {
          context.read<NewsLayout>().layout =
              index == 0 ? NewsLayouts.list : NewsLayouts.grid;
        },
        children: const [
          AnikkiIcon(icon: Icons.list),
          AnikkiIcon(icon: Icons.grid_view),
        ],
      ),
    );
  }
}
