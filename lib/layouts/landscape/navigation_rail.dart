import 'package:flutter/material.dart';
import 'package:kawanime/providers/navigation.dart';
import 'package:provider/provider.dart';


class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<Navigation>().index;

    return NavigationRail(
      selectedIndex: currentIndex,
      groupAlignment: 1.0,
      onDestinationSelected: (int index) {
        context.read<Navigation>().changeToPage(index);
      },
      labelType: NavigationRailLabelType.all,
      leading: const SizedBox(),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
          padding: EdgeInsets.symmetric(vertical: 4.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.folder),
          selectedIcon: Icon(Icons.folder),
          label: Text('Local'),
          padding: EdgeInsets.symmetric(vertical: 4.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.play_circle),
          selectedIcon: Icon(Icons.play_circle),
          label: Text('Player'),
          padding: EdgeInsets.symmetric(vertical: 4.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
          padding: EdgeInsets.symmetric(vertical: 4.0),
        ),
      ],
    );
  }
}
